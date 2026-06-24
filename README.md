# Typst Template for Books and Academic Papers

A flexible and elegant Typst template that supports both book and academic paper formatting.

## Features

- **Dual Format Support**: Easily switch between book and academic paper layouts
- **Professional Typography**: Uses Linux Libertine font for elegant text
- **Customizable Metadata**: Support for titles, subtitles, authors, affiliations, publishers, and more
- **Optional Table of Contents**: Automatically generated from headings
- **Auto-Numbering**: Heading numbering system for better document organization
- **Justified Text**: Professional text alignment for improved readability

## Getting Started

### Prerequisites

- [Typst](https://typst.app/) installed on your system

### Usage

#### For Books

Edit `example-book.typ` or create your own file:

```typst
#import "template.typ": *

#show: document-template.with(
  title: "My Book Title",
  subtitle: "A Subtitle",
  subsubtitle: "Volume I",
  author: "Author Name",
  publisher: "Publisher Name",
  year: "2026",
  show-outline: true,
  doc-type: "book",
)

= Chapter One
Your content here...
```

#### For Academic Papers

Edit `example-paper.typ` or create your own file:

```typst
#import "template.typ": *

#show: document-template.with(
  title: "Research Paper Title",
  subtitle: "Optional Subtitle",
  author: "Dr. Author Name",
  affiliation: "Department, University",
  year: "2026",
  show-outline: true,
  doc-type: "paper",
  abstract: "Your abstract text here...",
)

= Introduction
Your content here...
```

### Compilation

Compile your document to PDF:

```bash
typst compile example-book.typ
typst compile example-paper.typ
```

## Template Parameters

### Common Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `title` | string | "Untitled" | Main document title |
| `author` | string | "Anonymous" | Author name(s) |
| `year` | string | "" | Publication year |
| `show-outline` | boolean | `true` | Show table of contents |
| `doc-type` | string | "book" | Document type: "book" or "paper" |

### Book-Specific Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `subtitle` | string | "" | Book subtitle |
| `subsubtitle` | string | "" | Additional subtitle (e.g., Volume number) |
| `publisher` | string | "" | Publisher name |

### Paper-Specific Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `subtitle` | string | "" | Paper subtitle |
| `affiliation` | string | "" | Author affiliation/institution |
| `abstract` | string | "" | Paper abstract |

## File Structure

- **template.typ** - Main template with styling and configuration
- **example-book.typ** - Example book document
- **example-paper.typ** - Example academic paper
- **README.md** - This file

## Customization

You can customize the template by editing `template.typ`:

### Fonts

Change the font in the `set text()` rule:

```typst
set text(
  font: "Linux Libertine",  // Change this font name
  size: 12pt,
  leading: 1.6em,
)
```

### Page Size and Margins

Modify the `set page()` rule:

```typst
set page(
  paper: "a4",  // or "letter", "a5", etc.
  margin: (top: 2.5cm, bottom: 2.5cm, left: 3cm, right: 2.5cm),
  numbering: "1",
  number-align: center,
)
```

### Heading Styles

Adjust the heading configuration:

```typst
set heading(numbering: "1.")  // Change numbering style
```

### Font Sizes and Styles

Modify specific text sizes in the title page or abstract sections as needed.

## Document Structure

### Book Structure

```typst
= Chapter Title
Content here...

== Section Title
More content...

=== Subsection
Details...
```

### Paper Structure

```typst
= Introduction
= Related Work
= Methodology
= Results
= Conclusion
= References
```

## Examples

### Book with All Options

```typst
#show: document-template.with(
  title: "The Art of Writing",
  subtitle: "A Comprehensive Guide",
  subsubtitle: "Third Edition",
  author: "Sarah Mitchell",
  publisher: "Creative Press",
  year: "2026",
  show-outline: true,
  doc-type: "book",
)
```

### Simple Paper Without Outline

```typst
#show: document-template.with(
  title: "Machine Learning Applications",
  author: "Dr. Alex Chen",
  affiliation: "Stanford University",
  year: "2026",
  abstract: "This research explores...",
  doc-type: "paper",
  show-outline: false,
)
```

## Tips

- Use `= Heading 1` for main sections (chapters or major sections)
- Use `== Heading 2` for subsections
- Use `=== Heading 3` for sub-subsections
- Leave empty parameters as `""` to exclude them from the title page
- The template automatically handles spacing and formatting

## License

Free to use and modify for your projects!

## Support

For issues or questions about Typst, visit the [Typst documentation](https://typst.app/docs).
