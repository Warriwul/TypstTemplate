// Simple Typst Book Template
// A clean and minimal template for writing books

#let book-template(
  title: "Untitled",
  author: "Anonymous",
  date: "",
  show-outline: true,
  body,
) = {
  // Set page and text properties
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2.5cm),
    numbering: "1",
    number-align: center,
  )

  set text(
    font: "Linux Libertine",
    size: 12pt,
    leading: 1.6em,
  )

  set heading(numbering: "1.")

  // Title page
  align(center + horizon)[
    #text(size: 28pt, weight: "bold")[#title]
    
    #v(1em)
    
    #text(size: 14pt)[by #author]
    
    #v(2em)
    
    #text(size: 11pt, style: "italic")[#date]
  ]

  // Page break after title
  pagebreak()

  // Table of contents (optional)
  if show-outline {
    outline(
      title: "Contents",
      indent: auto,
    )

    pagebreak()
  }

  // Main content
  set par(justify: true)
  
  body
}
