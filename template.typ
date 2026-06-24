// Typst Template for Books and Academic Papers
// A flexible template that supports both book and paper layouts

#let document-template(
  title: "Untitled",
  subtitle: "",
  subsubtitle: "",
  author: "Anonymous",
  publisher: "",
  year: "",
  show-outline: true,
  doc-type: "book",  // "book" or "paper"
  affiliation: "",  // for academic papers
  abstract: "",  // for academic papers
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

  // Document type handling
  if doc-type == "book" {
    // BOOK LAYOUT
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

  } else if doc-type == "paper" {
    // ACADEMIC PAPER LAYOUT
    // Title and metadata
    align(center)[
      #text(size: 18pt, weight: "bold")[#title]
      
      #if subtitle != "" [
        #v(0.3em)
        #text(size: 14pt, weight: "semibold")[#subtitle]
      ]
      
      #v(0.8em)
      
      #text(size: 11pt)[#author]
      
      #if affiliation != "" [
        #v(0.2em)
        #text(size: 10pt, style: "italic")[#affiliation]
      ]
      
      #if year != "" [
        #v(0.2em)
        #text(size: 10pt)[#year]
      ]
    ]

    #v(1em)

    // Abstract (optional)
    if abstract != "" [
      #align(center)[
        #text(weight: "bold")[Abstract]
      ]
      
      #text(size: 10pt)[
        #abstract
      ]
      
      #v(1em)
    ]

    // Table of contents (optional)
    if show-outline {
      outline(
        title: "Contents",
        indent: auto,
      )

      pagebreak()
    }
  }

  // Main content
  set par(justify: true)
  
  body
}
