<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Extra Credit: Regular Expressions</li>
</ol>

## Chapter 2.2 --- Extra Credit

# Regular Expressions and Pattern Matching

> "Paymasters come in only two sizes: one sort shows you where the book says that you can't have what you've got coming to you; the second sort digs through the book until he finds a paragraph that lets you have what you need even if you don't rate it."
> <footer>Robert A. Heinlein, <em>The Door Into Summer</em></footer>

Regular Expressions and Pattern Matching are important features in any programming language; but surprisingly few come with robust support for high-level pattern matching out of the box.  Lisp comes with all the low-level building blocks necessary for high-level pattern matching, but high-level pattern matching was not included in the ANSI Standard.

Obviously, the gold-standard of pattern matching is Perl's Regular Expressions---and they are fully integrated with the Perl language so they can be used in-line everywhere.  The main complaint about regular expressions is that they quickly become dense and unreadable.  So many other strategies for pattern matching exist, which aim to increase legibility.

Perhaps one of the less well-known, but most important, facts about Lisp, is that Lisp is better at regular expressions than Perl---consider that!  Perl is *fast*, concise, and highly optimized; and regular expressions originate from Perl.  But the de-facto implementation of Perl-compatible regular expressions for Common Lisp, CL-PPCRE, is on average twice as fast as Perl itself.  This is just one of the many examples that illustrate, with hard benchmark results for proof, that Lisp is better than C for squeezing out maximum performance of your code.

In this Extra Credit chapter, we will take a tour of writing Perl-compatible regular expressions with the CL-PPCRE library, introduce alternative, more Lispy approaches to pattern matching with the Optima and ESRAP libraries, and then take a look at the CL21 project---which includes in-line regular expressions, amongst its many other cool features.

This chapter will contain exercises on using:

* CL-PPCRE
* Optima
* ESRAP
* CL21

## Exercise 2.2.1

**Pattern Matching**

## Exercise 2.2.2

**Pattern Matching with Regular Expressions**

## Exercise 2.2.3

**Regular Expression Syntax**

## Exercise 2.2.4

**String Escapes**

## Exercise 2.2.5

**In-line Regular Expressions with CL21**

## Exercise 2.2.6

**Optimized Pattern Matching with Optima**

## Exercise 2.2.7

**More Optima**

## Exercise 2.2.8

**Even More Optima**

## Exercise 2.2.9

**Pattern Matching with ESRAP**

## Exercise 2.2.10

**More ESRAP**

## Exercise 2.2.11

**Even More ESRAP**

<ul class="pager">
  <li class="previous"><a href="/book/2-01-0-programming-paradigms/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-03-0-objects-control/">Next &raquo;</a><li>
</ul>
