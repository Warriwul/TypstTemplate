// Typst Template for Books and Academic Papers
// A flexible template that supports both book and paper layouts

#let document-template(
  title: "Untitled",
  subtitle: "",
  subsubtitle: "",
  author: "Anonymous",  // string or array of strings
  publisher: "",
  year: "",
  show-outline: true,
  doc-type: "book",  // "book" or "paper"
  affiliation: "",  // for academic papers (string, array of strings, or array of arrays for per-author affiliations)
  abstract: "",  // for academic papers
  text-font: "Lato",  // font for body text
  math-font: "Lete Sans Math",  // font for mathematical expressions
  body,
) = {
  // Helper function to format authors with their affiliations
  #let format-authors(authors, affiliations: "") = {
    let author-list = if type(authors) == "array" { authors } else { (authors,) }
    
    // Handle affiliations: can be string, array of strings, or array of arrays
    let affil-list = ()
    if type(affiliations) == "array" {
      // Check if it's an array of arrays (per-author affiliations) or array of strings
      if affiliations.len() > 0 and type(affiliations.at(0)) == "array" {
        affil-list = affiliations  // array of arrays
      } else {
        affil-list = affiliations  // array of strings
      }
    } else if affiliations != "" {
      affil-list = (affiliations,)  // single string
    }
    
    if doc-type == "book" {
      author-list.join(" and ")
    } else {
      // For papers, format with affiliation superscripts
      let formatted = ()
      for (i, auth) in author-list.enumerate() {
        let auth-text = auth
        
        // Determine affiliation indices for this author
        if affil-list.len() > 0 {
          let indices = ()
          
          if type(affil-list.at(0)) == "array" {
            // Per-author affiliations: each author can have multiple affiliations
            if i < affil-list.len() {
              let author-affils = affil-list.at(i)
              if type(author-affils) == "array" {
                indices = author-affils
              } else if author-affils != "" {
                indices = (i + 1,)
              }
            }
          } else {
            // Simple array of strings: one affiliation per author
            if i < affil-list.len() and affil-list.at(i) != "" {
              indices = (i + 1,)
            }
          }
          
          if indices.len() > 0 {
            let superscript = indices.map(str).join(",")
            auth-text = [#auth#super[#superscript]]
          }
        }
        
        formatted.push(auth-text)
      }
      formatted.join(", ")
    }
  }
  
  // Helper function to extract and display unique affiliations
  #let display-affiliations(affiliations) = {
    let affil-list = if type(affiliations) == "array" { affiliations } else if affiliations != "" { (affiliations,) } else { () }
    
    if affil-list.len() == 0 {
      return
    }
    
    // If first element is an array, we have per-author affiliations
    if affil-list.len() > 0 and type(affil-list.at(0)) == "array" {
      // Flatten and deduplicate affiliations
      let unique-affils = ()
      let seen = ()
      
      for author-affils in affil-list {
        if type(author-affils) == "array" {
          for affil in author-affils {
            if affil != "" and affil not in seen {
              unique-affils.push(affil)
              seen.push(affil)
            }
          }
        }
      }
      
      // Display unique affiliations with indices
      for (i, affil) in unique-affils.enumerate() {
        if affil != "" [
          #text(size: 9pt, style: "italic")[#super[#(i + 1)] #affil] #linebreak()
        ]
      }
    } else {
      // Simple array of strings: one per author
      for (i, affil) in affil-list.enumerate() {
        if affil != "" [
          #text(size: 9pt, style: "italic")[#super[#(i + 1)] #affil] #linebreak()
        ]
      }
    }
  }
  
  // Set page and text properties
  set page(
    paper: "a4",
    margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2.5cm),
    numbering: "1",
    number-align: center,
  )

  set text(
    font: text-font,
    size: 12pt,
  )

  set math.equation(numbering: "(1)")
  set math.vec(delim: "[")
  set math.mat(delim: "[")

  // Set math font
  show math.equation: set text(font: math-font)

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
      
      #text(size: 14pt)[by #format-authors(author)]
      
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
      
      #text(size: 11pt)[#format-authors(author, affiliations: affiliation)]
      
      // Display affiliations with proper superscripts
      #let affil-list = if type(affiliation) == "array" { affiliation } else if affiliation != "" { (affiliation,) } else { () }
      #if affil-list.len() > 0 [
        #v(0.5em)
        #display-affiliations(affiliation)
      ]
      
      #if year != "" [
        #v(0.2em)
        #text(size: 10pt)[#year]
      ]
    ]

    #v(1em)

    // Abstract (optional)
    #if abstract != "" [
      #align(center)[
        #text(weight: "bold")[Abstract]
      ]
      
      #text(size: 10pt)[
        #abstract
      ]
      
      #v(1em)
    ]

    // Table of contents (optional)
    #if show-outline {
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
