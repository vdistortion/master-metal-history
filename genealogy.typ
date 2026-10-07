#let page-width = 140mm
#let page-height = 200mm
#let card-width = 24mm
#let card-height = 10mm
#let columns = (10mm, 42mm, 74mm, 106mm)
#let port-gap = 1.4mm
#let row-y(row) = 11mm + row * (card-height + 2.4mm)

#let projects = (
  (
    id: 1,
    title: "ШЕСТОЕ ЧУВСТВО",
    people: "Большаков со-товарищи",
    col: 0,
    y: row-y(0),
  ),
  (
    id: 2,
    title: "ФЛАМИНГО",
    people: "Большаков со-товарищи",
    col: 0,
    y: row-y(1),
  ),
  (
    id: 3,
    title: "ФАВОРИТ",
    people: "Большаков, Иншаков со-товарищи",
    col: 0,
    y: row-y(2),
  ),
  (
    id: 4,
    title: "КАРУСЕЛЬ / КОКТЕЙЛЬ",
    people: "Иншаков, Большаков, Шатуновский, Бутузов, Перфильев",
    col: 0,
    y: row-y(3),
  ),
  (
    id: 5,
    title: "ЗИГЗАГ",
    people: "Большаков, Бутузов, Вахмистров, Шатуновский (Чиняков)",
    col: 0,
    y: row-y(4),
  ),
  (
    id: 6,
    title: "ВИА \"ЗДРАВСТВУЙ, ПЕСНЯ\"",
    people: "Попов со-товарищи",
    col: 0,
    y: row-y(5),
  ),
  (id: 7, title: "ЧАС ПИК", people: "Серышев со-товарищи", col: 0, y: row-y(7)),
  (
    id: 8,
    title: "ЛИГА БЛЮЗА",
    people: "Кожин со-товарищи",
    col: 0,
    y: row-y(8),
  ),
  (id: 9, title: "ХЕЛЛЕР", people: "Сидоров со-товарищи", col: 0, y: row-y(9)),
  (
    id: 10,
    title: "ВАЛЬКИРИЯ",
    people: "Фомин со-товарищи",
    col: 2,
    y: row-y(12),
  ),
  (
    id: 11,
    title: "END ZONE",
    people: "Милованов со-товарищи",
    col: 0,
    y: row-y(12),
  ),
  (id: 12, title: "LIFE", people: "Лекс со-товарищи", col: 0, y: row-y(13)),
  (
    id: 13,
    title: "СМЕЩЕНИЕ",
    people: "Грановский и Потемкин со-товарищи",
    col: 1,
    y: row-y(0),
  ),
  (
    id: 14,
    title: "ВИА \"ПОЮЩИЕ СЕРДЦА\"",
    people: "Потемкин, Носков, Грановский, Львов, Покровский, Холстинин",
    col: 1,
    y: row-y(3),
  ),
  (
    id: 15,
    title: "ФОРТ-РОСС",
    people: "Потемкин, Арзамасков со-товарищи",
    col: 1,
    y: row-y(4),
  ),
  (
    id: 16,
    title: "МАСТЕР #1",
    people: "Большаков, Грановский, Молчанов, Покровский, Арзамасков, Попов",
    col: 1,
    y: row-y(5),
  ),
  (
    id: 17,
    title: "МАСТЕР #2",
    people: "Большаков, Грановский, Молчанов, Покровский, Попов, Корнеев",
    col: 1,
    y: row-y(6),
  ),
  (
    id: 18,
    title: "МАСТЕР #3",
    people: "Большаков, Грановский, Молчанов, Покровский, Серышев, Попов",
    col: 1,
    y: row-y(7),
  ),
  (
    id: 19,
    title: "МОСТ-ДЕЛЬТА",
    people: "Шендер со-товарищи",
    col: 2,
    y: row-y(8),
  ),
  (
    id: 20,
    title: "МАСТЕР #4",
    people: "Грановский, Большаков, Кожин, Серышев, Шендер",
    col: 1,
    y: row-y(8),
  ),
  (
    id: 21,
    title: "МАСТЕР #5",
    people: "Грановский, Большаков, Сидоров, Серышев, Шендер",
    col: 1,
    y: row-y(9),
  ),
  (
    id: 22,
    title: "МАСТЕР #6",
    people: "Грановский, Попов, Серышев, Шендер",
    col: 1,
    y: row-y(10),
  ),
  (
    id: 23,
    title: "МАСТЕР #7",
    people: "Грановский, Попов, Беркут, Шендер",
    col: 1,
    y: row-y(11),
  ),
  (
    id: 24,
    title: "МАСТЕР #8",
    people: "Грановский, Серышев, Фомин, Милованов",
    col: 1,
    y: row-y(12),
  ),
  (
    id: 25,
    title: "МАСТЕР #9",
    people: "Грановский, Фомин, Лекс, Милованов",
    col: 1,
    y: row-y(13),
  ),
  (
    id: 26,
    title: "МАСТЕР #10",
    people: "Грановский, Лекс, Страйк, Карпухин",
    col: 1,
    y: row-y(14),
  ),
  (
    id: 27,
    title: "МЛЕЧНЫЙ ПУТЬ",
    people: "Бабердин, Жариков, Крустер, Мирошников",
    col: 2,
    y: row-y(0),
  ),
  (
    id: 28,
    title: "МЛЕЧНЫЙ ПУТЬ",
    people: "Крустер, Бабердин, Грановский, Потемкин, Шелудченко",
    col: 1,
    y: row-y(1),
  ),
  (
    id: 29,
    title: "СМЕЩЕНИЕ",
    people: "Крустер, Грановский, Троянская, Шелудченко",
    col: 2,
    y: row-y(1),
  ),
  (
    id: 30,
    title: "РУЛА",
    people: "Крустер, Грановский, Бардзиловский, \"Батюшка\"",
    col: 2,
    y: row-y(2),
  ),
  (
    id: 31,
    title: "АЛЬФА",
    people: "Сарычев, Молчанов, Холстинин, Грановский",
    col: 2,
    y: row-y(3),
  ),
  (
    id: 32,
    title: "ВОЛШЕБНЫЕ СУМЕРКИ",
    people: "Холстинин, Дубинин, Беркут, Максимов, Могилевский",
    col: 3,
    y: row-y(3),
  ),
  (
    id: 33,
    title: "АВТОГРАФ",
    people: "Беркут, Ситковецкий, Михалин, Гуткин, Л. Макаревич",
    col: 3,
    y: row-y(4),
  ),
  (
    id: 34,
    title: "АРИЯ #1",
    people: "Грановский, Холстинин, Кипелов, Покровский, Львов",
    col: 2,
    y: row-y(5),
  ),
  (
    id: 35,
    title: "АРИЯ #2",
    people: "Кипелов, Большаков, Грановский, Молчанов, Холстинин, Покровский",
    col: 2,
    y: row-y(6),
  ),
  (
    id: 36,
    title: "АРИЯ #3",
    people: "Кипелов, Холстинин, Маврин, Удалов, Дубинин",
    col: 2,
    y: row-y(7),
  ),
  (id: 37, title: "ZOOOM", people: "Беркут со-товарищи", col: 2, y: row-y(10)),
  (
    id: 38,
    title: "ZOOOM",
    people: "Беркут, Попов, Шендер",
    col: 2,
    y: row-y(11),
  ),
  (
    id: 39,
    title: "МАВРИК #1",
    people: "Маврин, Беркут, Чиняков, Мосинян",
    col: 2,
    y: row-y(13),
  ),
  (
    id: 40,
    title: "МАВРИК #2",
    people: "Маврин, Стыров, Карпухин, Алексеев, Харьков",
    col: 2,
    y: row-y(14),
  ),
  (
    id: 41,
    title: "АРИЯ",
    people: "Холстинин, Дубинин, Удалов, Попов, Беркут",
    col: 3,
    y: row-y(14),
  ),
)

#let links = (
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 15),
  (6, 16),
  (7, 18),
  (8, 20),
  (9, 21),
  (10, 24),
  (11, 24),
  (12, 25),
  (13, 28),
  (28, 14),
  (14, 15),
  (15, 16),
  (16, 17),
  (17, 18),
  (18, 20),
  (20, 21),
  (21, 22),
  (22, 23),
  (23, 24),
  (24, 25),
  (25, 26),
  (19, 20),
  (27, 28),
  (28, 29),
  (29, 30),
  (30, 31),
  (31, 14),
  (14, 34),
  (31, 35),
  (34, 35),
  (35, 16),
  (35, 36),
  (36, 41),
  (32, 31),
  (32, 33),
  (33, 37),
  (37, 23),
  (23, 38),
  (38, 39),
  (39, 40),
  (40, 26),
  (38, 41),
  (39, 41),
)

#let project(id) = projects.find(item => item.id == id)
#let project-width(item) = card-width
#let project-x(item) = columns.at(item.col)

#let link-geometry(from-id, to-id) = {
  let from = project(from-id)
  let to = project(to-id)
  let from-width = project-width(from)
  let to-width = project-width(to)
  let x1 = project-x(from) + from-width / 2
  let y1 = from.y + card-height / 2
  let x2 = project-x(to) + to-width / 2
  let y2 = to.y + card-height / 2
  let dx = (x2 - x1) / 1mm
  let dy = (y2 - y1) / 1mm
  let angle = calc.atan2(dx, dy)
  let half-height = card-height / 2 / 1mm
  let from-half-width = from-width / 2 / 1mm
  let to-half-width = to-width / 2 / 1mm
  let from-edge-ratio = if dx == 0 {
    half-height / calc.abs(dy)
  } else if dy == 0 {
    from-half-width / calc.abs(dx)
  } else {
    calc.min(from-half-width / calc.abs(dx), half-height / calc.abs(dy))
  }
  let to-edge-ratio = if dx == 0 {
    half-height / calc.abs(dy)
  } else if dy == 0 {
    to-half-width / calc.abs(dx)
  } else {
    calc.min(to-half-width / calc.abs(dx), half-height / calc.abs(dy))
  }

  (
    sx: x1 + dx * from-edge-ratio * 1mm,
    sy: y1 + dy * from-edge-ratio * 1mm,
    tipx: x2 - dx * to-edge-ratio * 1mm,
    tipy: y2 - dy * to-edge-ratio * 1mm,
    angle: angle,
  )
}

#let path-segment(x1, y1, x2, y2) = {
  let dx = (x2 - x1) / 1mm
  let dy = (y2 - y1) / 1mm
  let length = calc.sqrt(dx * dx + dy * dy) * 1mm
  let angle = calc.atan2(dx, dy)
  place(top + left, dx: x1, dy: y1)[
    #line(length: length, angle: angle, stroke: 0.4pt + rgb("#666666"))
  ]
}

#let routed-points(from-id, to-id) = {
  let from = project(from-id)
  let to = project(to-id)
  let fx = columns.at(from.col)
  let tx = columns.at(to.col)
  let right = card-width
  let middle = card-height / 2

  if ((from-id == 27 and to-id == 28) or (from-id == 37 and to-id == 23)) {
    let going-right = to.col > from.col
    let start-x = if going-right { fx + right } else { fx }
    let tip-x = if going-right { tx } else { tx + right }
    ((start-x, from.y + card-height), (tip-x, to.y))
  } else if from-id == 31 and to-id == 14 {
    let lane = fx - 2.5mm
    (
      (fx, from.y + middle),
      (lane, from.y + middle),
      (lane, to.y + middle),
      (tx + right, to.y + middle),
    )
  } else if from-id == 14 and to-id == 34 {
    let lane = (fx + right + tx) / 2
    (
      (fx + right, from.y + middle + port-gap),
      (lane, from.y + middle + port-gap),
      (lane, to.y + middle),
      (tx, to.y + middle),
    )
  } else if from-id == 31 and to-id == 35 {
    let lane = (fx + right + columns.at(3)) / 2
    (
      (fx + right, from.y + middle + port-gap),
      (lane, from.y + middle + port-gap),
      (lane, to.y + middle),
      (tx + right, to.y + middle),
    )
  } else if from-id == 33 and to-id == 37 {
    // Обходим «МОСТ-ДЕЛЬТУ» справа, отдельно от линии «АЛЬФА» → «АРИЯ #2».
    let lane = fx - 2mm
    (
      (fx, from.y + middle),
      (lane, from.y + middle),
      (lane, to.y + middle),
      (tx + right, to.y + middle),
    )
  } else if from-id == 36 and to-id == 41 {
    // Крайний справа вход в «АРИЮ»; ещё два равномерно распределены слева.
    let lane = tx + right / 2 + port-gap
    ((fx + right, from.y + middle), (lane, from.y + middle), (lane, to.y))
  } else if from-id == 38 and to-id == 39 {
    // Нижний выход из ZOOOM: обходим «ВАЛЬКИРИЮ» по правому краю.
    let lane = (fx + right + columns.at(3)) / 2
    (
      (fx + right, from.y + middle + port-gap / 2),
      (lane, from.y + middle + port-gap / 2),
      (lane, to.y + middle),
      (tx + right, to.y + middle),
    )
  } else if from-id == 38 and to-id == 41 {
    let entry-x = tx + right / 2
    (
      (fx + right, from.y + middle - port-gap / 2),
      (entry-x, from.y + middle - port-gap / 2),
      (entry-x, to.y),
    )
  } else if from-id == 39 and to-id == 41 {
    let entry-x = tx + right / 2 - port-gap
    (
      (fx + right, from.y + middle + port-gap),
      (entry-x, from.y + middle + port-gap),
      (entry-x, to.y),
    )
  } else {
    none
  }
}

#let connector(from-id, to-id) = {
  let points = routed-points(from-id, to-id)
  if points == none {
    let geometry = link-geometry(from-id, to-id)
    path-segment(geometry.sx, geometry.sy, geometry.tipx, geometry.tipy)
  } else {
    for i in range(0, points.len() - 1) {
      let start = points.at(i)
      let end = points.at(i + 1)
      path-segment(start.at(0), start.at(1), end.at(0), end.at(1))
    }
  }
}

#let arrowhead(from-id, to-id) = {
  let points = routed-points(from-id, to-id)
  let geometry = if points == none {
    link-geometry(from-id, to-id)
  } else {
    let prev = points.at(points.len() - 2)
    let tip = points.last()
    (
      tipx: tip.at(0),
      tipy: tip.at(1),
      angle: calc.atan2(
        (tip.at(0) - prev.at(0)) / 1mm,
        (tip.at(1) - prev.at(1)) / 1mm,
      ),
    )
  }
  place(top + left, dx: geometry.tipx, dy: geometry.tipy)[
    #line(
      length: 0.9mm,
      angle: geometry.angle + 150deg,
      stroke: 0.4pt + rgb("#444444"),
    )
  ]
  place(top + left, dx: geometry.tipx, dy: geometry.tipy)[
    #line(
      length: 0.9mm,
      angle: geometry.angle + 210deg,
      stroke: 0.4pt + rgb("#444444"),
    )
  ]
}

#let project-card(item) = {
  let width = project-width(item)
  let x = project-x(item)
  let people = item.people.replace("со-товарищи", "со‑товарищи")
  place(top + left, dx: x, dy: item.y)[
    #rect(
      width: width,
      height: card-height,
      fill: white,
      stroke: 0.4pt + black,
      inset: 0pt,
      radius: 0pt,
    )[
      #set par(
        spacing: 0pt,
        first-line-indent: 0pt,
        justify: false,
        linebreaks: "simple",
      )
      #grid(
        columns: (width,),
        rows: (3.4mm, 6.6mm),
        row-gutter: 0pt,
        align: center + horizon,
        [
          #set par(leading: 0.05em)
          #text(
            font: "Libertinus Serif",
            size: 4.3pt,
            weight: "bold",
          )[#item.title]
        ],
        [
          #set par(leading: 0.3em)
          #text(font: "Libertinus Serif", size: 4.4pt)[#people]
        ],
      )
      #place(top + left, dx: 0.4pt, dy: 3.4mm)[
        #line(length: width - 0.8pt, stroke: 0.25pt + black)
      ]
    ]
  ]
}

#page(width: page-width, height: page-height, margin: 0pt)[
  #set text(
    font: "Libertinus Serif",
    lang: "ru",
    region: "ru",
    hyphenate: false,
  )
  #box(width: page-width, height: page-height)[
    #place(top + center, dy: 4mm)[
      #set par(first-line-indent: 0pt, justify: false, spacing: 0pt)
      #text(size: 10pt, weight: "bold", "Генеалогическое древо группы «МАСТЕР»")
    ]
    #for link in links {
      connector(link.at(0), link.at(1))
    }
    #for item in projects {
      project-card(item)
    }
    #for link in links {
      arrowhead(link.at(0), link.at(1))
    }
  ]
]
