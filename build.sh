#!/bin/bash

# Список необходимых пакетов и соответствующих им команд
declare -A DEPS=( ["typst"]="typst" ["typstyle"]="typstyle" ["gs"]="ghostscript" )
MISSING=()

# 1. Проверка наличия программ
for cmd in "${!DEPS[@]}"; do
    if ! command -v "$cmd" &> /dev/null; then
        MISSING+=( "${DEPS[$cmd]}" )
    fi
done

# 2. Установка недостающих программ
if [ ${#MISSING[@]} -ne 0 ]; then
    if [[ "$1" == "--ci" ]]; then
        echo "CI режим: установка недостающих пакетов: ${MISSING[*]}"
        pacman -S --needed --noconfirm "${MISSING[@]}"
    else
        echo "Для работы не хватает: ${MISSING[*]}"
        read -p "Установить их через sudo pacman? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            sudo pacman -S --needed "${MISSING[@]}"
        else
            echo "Ошибка: сборка невозможна без установленных зависимостей."
            exit 1
        fi
    fi
fi

# 3. Форматирование кода
if command -v typstyle &> /dev/null; then
    echo "Форматирование исходников..."
    typstyle -i *.typ --wrap-text
fi

# 4. Компиляция книги
echo "Компиляция PDF..."
typst compile book.typ --font-path ./fonts --root .

# 6. Оптимизация PDF
if command -v gs &> /dev/null && [ -f "book.pdf" ]; then
    echo "Оптимизация размера PDF (сжатие изображений и шрифтов)..."
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
       -dNOPAUSE -dQUIET -dBATCH -sOutputFile=book_optimized.pdf book.pdf

    mv book_optimized.pdf book.pdf
    echo "Размер PDF успешно оптимизирован."
fi

echo "Готово! Файл book.pdf обновлен."
