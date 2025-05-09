#import "@preview/i-figured:0.2.4"
#import "../utils/style.typ": ziti, zihao
#import "../utils/header.typ": main-text-page-header
#import "../utils/heading.typ": main-text-first-heading, other-heading

#let mainmatter(
  doctype: "master",
  twoside: false,
  body,
) = {
  set page(numbering: "1")
  counter(page).update(1)

  show: main-text-page-header.with(
    doctype: doctype,
    twoside: twoside,
  )
  show: main-text-first-heading.with(
    doctype: doctype,
    twoside: twoside,
  )
  show: other-heading

  show heading: i-figured.reset-counters.with(extra-kinds: ("image", "image-en"))
  show figure: i-figured.show-figure.with(
    extra-prefixes: (image: "img:"),
    numbering: if doctype == "bachelor" { "1-1" } else { "1.1" },
  )
  show math.equation: i-figured.show-equation.with(numbering: if doctype == "bachelor" { "(1-1)" } else { "(1.1)" })
  show math.equation: set text(
    font: (
      (name: "Noto Sans CJK SC", covers: regex("\p{script=Han}")),
      "Cambria Math",
    ),
  )
  set math.equation(number-align: end + bottom)

  context [
    #metadata(state("total-words-cjk").final()) <total-words>
    #metadata(state("total-characters").final()) <total-chars>
  ]

  body
}
