<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Functions and Macros</li>
</ol>

## Chapter 1.10

# Functions and Macros

> "The greatest productive force is human selfishness."
> <footer>Robert A. Heinlein, <em>Time Enough For Love</em></footer>

At the end of the day, most of the Lisp code you write will probably be Function or Macro definitions; after all, not only will they finally enable you to start doing some interesting programming, they are---arguably---the core of Lambda Calculus, Functional Programming, and the Lisp-family of programming languages.  Even if you choose to favor Object-Oriented Programming as your go-to paradigm, you'll be using what you've learned here in this chapter.

You've already seen some functions and macros in action; other than the low-level *special forms*, most of the Lisp language as defined in the ANSI Standard is actually implemented in Common Lisp as functions in the `COMMON-LISP` package.  When working at the REPL, these functions are all imported for you into your own personal namespace, `CL-USER`.  But some of the Common Lisp language is also implemented as Macros---remember `with-open-file`?  That is a common use of Macros as used in the Common Lisp language itself, `with-...` forms.  But also, every definition form you use is *also* a macro.

You can think of Functions as lexically closed blocks of code.  You write functions to extend the vocabulary of Lisp.

Macros are, at least on the surface, very similar to functions; however, they also allow the programmer to use *backtick syntax*, a highly expressive notation for marking-up code transformation.  Due to the expressive power of macros in Common Lisp, you can say that Lisp macros not only allow you to extend the vocabulary, but also modify the syntax of Lisp to your heart's desire.  Macros are often used to reduce repetitive, predictable code to a single line; combine related functionality into a simple call that expands into Lisp procedurally based on input; and for writing Domain-Specific Languages, a topic we will cover exclusively in Chapter 1.19.

For now, we will focus on the core of writing anonymous and named functions with dynamic and lexical scope, writing recursive functions, tail-call optimization, and writing your first macros to keep your code tidy and expressive.

This chapter will contain exercises on:

* LAMBDA: Anonymous Functions
* Global Functions/top-level forms
* Local Functions/lexical forms
* Recursive Functions
* Tail-Call Optimization
* Defining Macros
* Backtick syntax

<ul class="pager">
  <li class="previous"><a href="/book/1-09-0-closures/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-11-0-text-adventure/">Next &raquo;</a><li>
</ul>
