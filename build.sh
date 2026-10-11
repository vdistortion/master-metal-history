#!/usr/bin/env bash

set -euo pipefail

OUTPUT_PDF="Vladimir_Marochkin_Master_2003.pdf"
OPTIMIZED_PDF="${OUTPUT_PDF%.pdf}.optimized.pdf"

# Список необходимых пакетов и соответствующих им команд
declare -A DEPS=( ["typst"]="typst" ["gs"]="ghostscript" )
MISSING=()

# 1. Проверка наличия программ
for cmd in "${!DEPS[@]}"; do
    if ! command -v "$cmd" &> /dev/null; then
        MISSING+=( "${DEPS[$cmd]}" )
    fi
done

# 2. Установка недостающих программ
if [ ${#MISSING[@]} -ne 0 ]; then
        if [[ "${1:-}" == "--ci" ]]; then
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

# 3. Компиляция книги
echo "Компиляция PDF..."
typst compile book.typ "$OUTPUT_PDF" --font-path ./fonts --root .

# 4. Оптимизация PDF
if command -v gs &> /dev/null && [ -f "$OUTPUT_PDF" ]; then
    echo "Оптимизация размера PDF (сжатие изображений и шрифтов)..."
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
       -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$OPTIMIZED_PDF" "$OUTPUT_PDF"

    mv -f -- "$OPTIMIZED_PDF" "$OUTPUT_PDF"
    echo "Размер PDF успешно оптимизирован."
fi

echo "Готово! Создан файл: $OUTPUT_PDF"
