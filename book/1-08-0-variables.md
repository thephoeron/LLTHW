<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Variables, Parameters, and Constants</li>
</ol>

## Chapter 1.8

# Variables, Parameters, and Constants

> "In a dilemma, it is helpful to change any variable, then reexamine the problem."
> <footer>Robert A. Heinlein, <em>Have Space Suit---Will Travel</em></footer>

By this point, you may be pretty tired of having to manually re-type all your data every time you want to use them---but don't worry, you won't have to do that anymore.  Whenever you want to use or re-use data---say, a string, number, list, or whatever else your program might need to pass around---you can *bind* a symbol and *assign* a value to it.

In keeping with the idea that "Lisp is different," variables are very different in Lisp from other programming languages.  Some Lisp Hackers like to compare them to pointers in C and C++, but I have found that such a comparison overcomplicates a much simpler system.  Once you know that the variable's *symbol* is not the variable itself, it is easy to see that the variable's *assignment* is a literal pointer to a memory address, without worrying about the extra complications that come with pointers in C or C++.

You may have also heard that Common Lisp is a "Lisp-2"; while all Lisp-family languages have lexical scope---a neat feature that we will cover in this chapter's exercises as well as extend upon in the following chapter---other Lisps such as Clojure, Scheme, Racket, and Emacs Lisp don't have separate namespaces for variables and functions within the same lexical scope.  So, for example, in Common Lisp you can have both a function and a variable with the same name in the same scope; context tells the Lisp reader which definition to use.

This chapter will contain exercises on:

* Symbols
* Binding and Assignment
* (Global) Dynamic Variables
* (Local) Lexical Variables
* Re-assigning Values to Variables
* Parameters
* Constants

## Exercise 1.8.1

**Symbols**

## Exercise 1.8.2

**Symbol Tables**

## Exercise 1.8.3

**More Symbols: Binding and Assignment**

## Exercise 1.8.4

**Even More Symbols: Namespaces**

## Exercise 1.8.5

**DEFVAR: Dynamic Binding of Variables**

## Exercise 1.8.6

**LET: Lexical Binding of Variables**

## Exercise 1.8.7

**SETQ vs SETF**

## Exercise 1.8.8

**DEFPARAMETER: Dynamic Binding Revisited**

## Exercise 1.8.9

**DEFCONSTANT**

## Exercise 1.8.10

**Function Parameters**



<ul class="pager">
  <li class="previous"><a href="/book/1-07-0-arrays/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-09-0-closures/">Next &raquo;</a><li>
</ul>
