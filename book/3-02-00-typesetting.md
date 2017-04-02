<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-00-00-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Typesetting</li>
</ol>

## Chapter 3.2

# Typesetting

> "You don't pay back, you pay forward."
> <footer>Robert A. Heinlein, <em>as quoted by Jerry Pournelle in Starswarm</em></footer>

The Web and Plain Text aren't the only document formats you can target with Common Lisp.  You can generate code for any other programming language, including the TeX Typesetting System, it's variants and extensions LaTeX, ConTeXt, and XeTeX, such as with the CL-Docutils library; or you can typeset your documents as PDF natively from within Lisp using the CL-Typesetting and CL-PDF libraries.

In this chapter we will explore single-source documents with multiple output formats; structured text formats; native CL-Typesetting syntax; book design; fonts &amp; typography; in-line graphics; typesetting math; self-publishing your documents and books; and collect everything together in a library that will let you focus entirely on your writing while simultaneously publishing professional documents to every platform and medium.

## Exercise 3.2.1

**CL-Typesetting Syntax**

```lisp

```

## Exercise 3.2.2

**Markdown vs. reStructuredText**

(and thus, CL-Typesetting vs. CL-Docutils)

Note: we will prefer CL-Typesetting integrated with 3bmd for a Lispier solution; but CL-Docutils is useful for outputting LaTeX.

```lisp

```

## Exercise 3.2.3

**Integrating 3bmd with CL-Typesetting**

```lisp

```

## Exercise 3.2.4

**Target Templates**

Highlight unique considerations for:

* LaTeX
* PDF/Print
* Ebook
* Web
* Screen Readers

```lisp

```

## Exercise 3.2.5

**Book Design**

```lisp

```

## Exercise 3.2.6

**Fonts &amp; Typography**

```lisp

```

## Exercise 3.2.7

**Document Structure**

```lisp

```

## Exercise 3.2.8

**White-space and Black-space**

```lisp

```

## Exercise 3.2.9

**Headers, Footers, and Margins**

```lisp

```

## Exercise 3.2.10

**Footnotes, Citations, Bibliographies**

```lisp

```

## Exercise 3.2.11

**Contents and Indices**

```lisp

```

## Exercise 3.2.12

**In-Line Graphics and Plots**

```lisp

```

## Exercise 3.2.13

**Typesetting Mathematical Notation**

```lisp

```

## Exercise 3.2.14

**Self-Publishing Services**

```lisp

```

## Project 3.2.15

**CL-BookKit: A Single-Source Publishing Library for Typesetting in Common Lisp**

Output to:

* PDF/Print
* Ebook
* Web
* Plain-Text

```lisp

```

<ul class="pager">
  <li class="previous"><a href="/book/3-01-00-web-apps/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-03-00-mobile.md">Next &raquo;</a><li>
</ul>
