// --- ГЕОМЕТРИЯ И ПАРАМЕТРЫ СТРАНИЦЫ ---
#set page(
  width: 140mm,
  height: 200mm,
  margin: (inside: 20mm, outside: 15mm, top: 15mm, bottom: 15mm),
  numbering: none, // По умолчанию отключено для титульных страниц
  footer: context {
    let page_num = counter(page).at(here()).first()

    // ПРАВИЛО: Не отображаем номер на первой странице текста (которая физически 5-я)
    if page_num == 1 { return none }

    // Отображаем номера только там, где включена нумерация (через set page)
    if here().page-numbering() != none {
      set text(font: "Nimbus Sans", size: 9pt)
      let display_num = counter(page).display()
      if calc.even(here().page()) {
        align(left, strong(display_num)) // Четные слева
      } else {
        align(right, strong(display_num)) // Нечетные справа
      }
    }
  },
)

// --- ТИПОГРАФИКА (Книжные стандарты) ---
#set text(
  font: "Libertinus Serif", // Качественная антиква из вашего списка
  size: 10.5pt,
  lang: "ru",
  region: "ru",
  hyphenate: true, // Включает переносы слов для красивого края
)

#set par(
  justify: true,
  leading: 0.65em,
  spacing: 0.65em, // Настройка интервала без предупреждений о "blocks"
  first-line-indent: 1.5em, // Абзацный отступ (красная строка)
  linebreaks: "optimized",
)

// --- СТИЛИЗАЦИЯ ЭЛЕМЕНТОВ ---
#show heading: set text(font: "Nimbus Sans", weight: "bold")
#show heading: set block(above: 2em, below: 1em)

// Оформление подписей к рисункам (курсив, Nimbus Sans, малый размер, без слова "Рисунок")
#show figure.caption: it => [
  #set text(size: 8.5pt, style: "italic", font: "Nimbus Sans")
  #it.body
]
// placement: auto заставляет текст обтекать картинки, убирая пустые места
#set figure(gap: 1em, placement: auto)

// --- СТРУКТУРА ДОКУМЕНТА ---

// 1 и 2: Передняя обложка и её оборот
#page(margin: 0pt)[#image("images/Cover1.png", width: 100%, height: 100%)]
#page(margin: 0pt)[#image("images/Cover2.png", width: 100%, height: 100%)]

// 3: Главный титульный лист
#page[
  #set align(center)
  #v(20%)
  #text(size: 26pt, weight: "bold")[МАСТЕР]

  #v(2em)
  #text(size: 14pt, tracking: 1.5pt)[
    ИСТОРИЯ \
    ДИСКОГРАФИЯ \
    ФОТОМАТЕРИАЛЫ
  ]

  #v(1fr) // Прижимает блок ниже к самому низу страницы
  #text(size: 11pt)[
    Москва \
    НОТА-Р \
    2003
  ]
]

// 4: Страница с ISBN и выходными данными
#page[
  #v(1fr)
  #set text(size: 9pt)
  УДК 821.161.1 \
  ББК 84(2Рос=Рус)6 \
  ISBN 5-98037-024-3

  #v(1em)
  © Оформление. НОТА-Р, 2003
]

// 5: Титул первой части и начало официального отсчета
#set page(numbering: "1") // Включаем нумерацию (футер начнет её видеть)
#counter(page).update(1) // Сбрасываем счетчик: эта страница — №1

#page[
  #set align(center)
  #v(30%)
  #text(size: 22pt, weight: "bold")[МАСТЕР]
  #v(1.5em)
  #text(size: 16pt)[ИСТОРИЯ ГРУППЫ]
]

// --- ОСНОВНОЙ КОНТЕНТ ---
#include "master-book.typ"

// --- ЗАВЕРШЕНИЕ (Задние обложки) ---
#set page(numbering: none)
#page(margin: 0pt)[#image("images/Cover3.png", width: 100%, height: 100%)]
#page(margin: 0pt)[#image("images/Cover4.png", width: 100%, height: 100%)]
