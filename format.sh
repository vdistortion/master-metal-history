#!/bin/bash

set -euo pipefail

if ! command -v typstyle &> /dev/null; then
    echo "Ошибка: не найден typstyle. Установите Typstyle или запустите сборку без форматирования."
    exit 1
fi

echo "Форматирование исходников Typst..."
typstyle -i ./*.typ --wrap-text
echo "Готово."
