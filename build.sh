#!/bin/bash

echo "Форматирование кода..."
typstyle -i *.typ --wrap-text

echo "Сборка PDF..."
typst compile book.typ

echo "Генерация README.md..."
pandoc master-book.typ -f typst -t gfm -o README.md

echo "Готово! Проверьте book.pdf и README.md"
