// Simple Typst Book Template
// A clean and minimal template for writing books

#let book-template(
  title: "Untitled",
  subtitle: "",
  subsubtitle: "",
  author: "Anonymous",
  publisher: "",
  year: "",
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
    
    #if subtitle != "" [
      #v(0.5em)
      #text(size: 18pt, weight: "semibold")[#subtitle]
    ]
    
    #if subsubtitle != "" [
      #v(0.3em)
      #text(size: 14pt)[#subsubtitle]
    ]
    
    #v(1.5em)
    
    #text(size: 14pt)[by #author]
    
    #if publisher != "" [
      #v(0.5em)
      #text(size: 11pt)[#publisher]
    ]
    
    #v(2em)
    
    #if year != "" [
      #text(size: 11pt, style: "italic")[#year]
    ]
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
