#import "metadata.typ": commit_hash

#set heading(numbering: "1")

#set page(
    paper: "a4",

    header: align(right)[Version #commit_hash],
    numbering: "1",
)

#set par(justify: true)

#set text(
    font: "New Computer Modern",
    size: 10pt,
)

// TODO: Waiting for a real maketitle in Typst
#align(center)[
    #align(center, text(17pt)[Category Theory: Lecture Notes])

    Serge Lechenne #h(40pt) Lucas Tabary Maujean #h(40pt) Arthur Adjedj \
    Balthazar Patchiatchvily #h(40pt) Vincent Lafeychine
]

#v(10pt)

#include "introduction.typ"
