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
#page(margin: 0pt)[#image("images/Cover1.webp", width: 100%, height: 100%)]
#page(margin: 0pt)[#image("images/Cover2.webp", width: 100%, height: 100%)]

// 3: Главный титульный лист
#page[
  #set align(center)
  #v(20%)
  #text(size: 26pt, weight: "bold")[«МАСТЕР»]

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

// 4: Страница с выходными данными и ISBN
#page[
  #set text(size: 9pt)

  // Верхний блок классификаторов
  УДК 783 \
  ББК 85.956.4 \
  М79

  #v(3em)
  #set align(center)

  // Информация о подготовке
  Подготовка к печати — Русские Арт Технологии \
  http://www.pre-press.ru, e-mail: publish\@pre-press.ru

  #v(1.5em)
  #set par(justify: true, first-line-indent: 0pt)

  В книге использованы фотографии Владислава Елина, Сергея Маврина, Владимира
  Марочкина, Георгия Молитвина, Захара Увайского, Глеба Обуховского, Ильи
  Дудкина и Олега Распопова, а также из архива группы «Мастер». Приносим
  извинения всем неизвестным авторам фотографий, чьи авторские права будут
  восстановлены в следующих изданиях.

  #v(1em)
  Генеалогическое древо группы «Мастер» составил Владимир Марочкин.

  #v(1em)
  Автор хотел бы поблагодарить Маргариту Пушкину и Дмитрия Мельникова за
  неоценимую поддержку, оказанную в момент работы над биографией группы
  «Мастер». А также — Андрея Игнатьева за подаренную правильную терминологию.

  #v(1.5em)
  Редактор — Виктор Троегубов

  #v(1fr) // Пружина прижимает юридический блок к низу

  #set align(left)
  Охраняется законом РФ об авторском праве. \
  Воспроизведение всей книги или любой ее части запрещается без письменного
  разрешения издателя. Любые попытки нарушения закона будут преследоваться в
  судебном порядке.

  #v(2em)

  // Сетка для ISBN и копирайтов
  #grid(
    columns: (1fr, 1fr),
    [
      ISBN 5-85929-082-9 \
      #v(0.5em)
      © Владимир Марочкин, текст, 2003 \
      © НОТА-Р, оформление, 2003 \
      #v(0.5em)
      Код ОКДП 953000
    ],
    align(right + bottom)[
      // Если у вас есть файл штрих-кода, вставьте его здесь
      // #image("images/barcode.png", width: 3.5cm)
      #text(size: 7pt)[ISBN 5-85929-082-9] \
      #image("images/barcode.gif", width: 3.5cm) // Вставка штрих-кода
    ],
  )
]

// 5: Титул первой части и начало официального отсчета
#set page(numbering: "1") // Включаем нумерацию (футер начнет её видеть)
#counter(page).update(1) // Сбрасываем счетчик: эта страница — №1

#page[
  #set align(center)
  #v(30%)
  #text(size: 22pt, weight: "bold")[«МАСТЕР»]
  #v(1.5em)
  #text(size: 16pt)[ИСТОРИЯ ГРУППЫ]
]

// --- ОСНОВНОЙ КОНТЕНТ ---
#include "master-book.typ"

// --- ЗАВЕРШЕНИЕ (Задние обложки) ---
#set page(numbering: none)
#page(margin: 0pt)[#image("images/Cover3.webp", width: 100%, height: 100%)]
#page(margin: 0pt)[#image("images/Cover4.webp", width: 100%, height: 100%)]
