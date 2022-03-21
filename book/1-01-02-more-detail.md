<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Lisp in More Detail</li>
</ol>

## Exercise 1.1.2

# Lisp in More Detail

*Revision Note:* This exercise needs to be split up into an exercise per section.

## The REPL

The Lisp REPL---a READ-EVAL-PRINT Loop---is the core of the interactive approach to Lisp development.  You type in an expression, the expression is *read*, *evaluated*, the return result is *printed*, and then it waits for more input.  The REPL is marked by a prompt, like the command line for your operating system, and it is the main interface to your current running Lisp image. Depending on the implementation of Lisp you are using, you may see different prompts.  You can also customize your prompt, but the means of doing so are implementation-dependent.

Typically, imagining that the underscore character below is your blinking cursor, you'll see something to the effect of:

```lisp
CL-USER> _
```

But in SBCL, the default prompt is much less informative:

```lisp
* _
```

For convenience sake, when you should enter a piece of code in the REPL for immediate evaluation, each line of code will be marked by the SBCL prompt character.  When you should enter all the code given in a file, there will be no prompt character preceding each line, and you will be provided with a file name to enter it in.

Remember, you don't type in the prompt character `*` at the REPL; even if your prompt looks different, the `*` *represents* all Common Lisp REPL prompts.  For example, you'll often see code examples like this:

```lisp
* (+ 1 1)

2
* (apply #'+ 1 2 3 4 '(5 6))

21
```

The example above means, you first enter the expression `(+ 1 1)` in the REPL; evaluating it returns the result `2`, exactly what you would expect to get back for 1 + 1.  Then, you get back to the prompt, and can enter the expression, `(apply #'+ 1 2 3 4 '(5 6))`, which returns `21`.  If you're using SBCL from the command-line, this shows a direct transcript of the session---extra line-break between the evaluated expression and return result and all.  If you are using Emacs+SLIME, you won't see that extra line-break.

A lot of Lisp literature and reference works explicitly mark the return value with an ASCII-formatted fat arrow: `=>`.  This can make spotting the return value of a form much easier in examples.  We will adopt this convention herein as well, when it is necessary for visual clarity.  In such a case, the examples above would then look like this:

```lisp
* (+ 1 1)
=> 2
* (apply #'+ 1 2 3 4 '(5 6))
=> 21
```

In most exercises, we will separate the code examples into two copies: first, just the code you are meant to type, and then again with the correct return results for you to compare your work.

## Expressions, Parentheses, and Return Values

In the pedantic spirit of programming, it is worth reminding you that *everything* you type at the REPL or in your Lisp source code files will be *read as* or *expanded into* an S-Expression and evaluated if possible.  Quoting is one way you can disable evaluation for a nested S-Expression, but some S-Expressions are never evaluated.  If your Lisp implementation can't read what you've entered as a valid S-Expression, you will normally be dropped into the debugger, the same way that it would if it tried and failed to evaluate.

```lisp
* (+ 1 1)
=> 2 ;; as expected, because it's a valid S-Expression
* {+ 1 1}
;; this won't evaluate, because the Lisp reader doesn't recognize braces
```

Common Lisp only has S-Expressions; imperative programming languages, for example, differentiate between 'statements' and 'expressions', by ruling that statements cause changes to the environment and return nothing, while expressions are used for their return values.  In the tradition of the Lisp-family of programming languages, the syntax is minimalist by design---so in Lisp, even a destructive, in-place operation is represented as an S-Expression. Destructive, in-place operations are by convention named with a prepended "N", to make it obvious that they have side-effects:

```lisp
;; first lets define a couple variables
* (defvar *test-list-a* '(a b c))
* (defvar *test-list-b* '(d e f))
;; append returns a new list from its arguments
* (append *test-list-a* *test-list-b*)
=> (A B C D E F)
;; you can see that the original lists haven't changed
* *test-list-a*
=> (A B C)
* *test-list-b*
=> (D E F)
;; but now lets do a destructive operation, NCONC (ie, in-place list concatenation)
* (nconc *test-list-a* *test-list-b*)
=> (A B C D E F)
;; the variable's binding and assignment haven't changed, but the last cons-cell
;; now points to *test-list-b* instead of terminating at NIL
* *test-list-a*
=> (A B C D E F)
```

Expressions, in an abstract sense, are *expected to* return a value; S-Expressions in Common Lisp almost always do, as well, but there are some exceptions. A function call, for example, is expected to return the value of the last form in its body as the value of the entire function:

```lisp
;; this is a typical anonymous function call; the last form in its body is (+ x x)
;; so the function call returns (+ 2 2) => 4
* ((lambda (x) (+ x x)) 2)
=> 4
;; in this function, the return result of (+ x x) is not assigned so it is essentially
;; lost; the function body moves on to the next form, (* x x), which is the last form
;; of this function body. So the function call only returns (* 10 10) => 100
* ((lambda (x) (+ x x) (* x x)) 10)
=> 100
;; in this function, we capture the return values of both (+ x x) and (* x x), as the
;; lexical variables SUM and PRODUCT; using VALUES, we can return multiple values from
;; a form instead of just one
* ((lambda (x) (let ((sum (+ x x)) (product (* x x))) (values sum product))) 10)
=> 20 100
;; but calling VALUES without anything gives us... an expression with no return result!
* (values)
=> ; No value
```

As was introduced in the previous exercise, an S-Expression can either be an *Atom* or a *Cons-Cell*.  Cons-Cells are represented by Lists to the Reader and by the Printer---but the empty list is treated as an Atom because it requires no consing.

A subset of Atoms are called *self-evaluating objects*.  Since expressions are expected to return a value, these particular objects simply return themselves.  By quoting an expression, you are effectively turning the quoted expression into a self-evaluating object.

```lisp
;; these are some self-evaluating objects:
;; strings---
* "a string"
;; characters---
* #\greek_small_letter_lamda
;; numbers
* 42
* #x2A
;; bit-vectors---
* #*1001
```

Note: `#x2A` looks like it returns something different, but it doesn't---the underlying integer of both the decimal representation `42` and the hexadecimal representation `#x2A` are the same number.  This can be proved with `(eq 42 #x2A)`.

Lists are ordered collections of S-Expressions surrounded in a pair of parentheses, with the items separated by whitespace---the *amount* of whitespace does not matter to the Lisp reader, but there are fairly strict style conventions on how to format your code which will be detailed in the next exercise.  Again, non-empty lists are read as cons-cells, and cons-cells are printed as lists.  But lists are also a proper data type in Lisp, so it's important to remember the distinction between *representation* and the actual *implementation*.

```lisp
;; this:
'(a b c)
;; is the same as this:
'(a
  b
  c)
;; and this:
(list 'a 'b 'c)
```

When a list is *evaluated*, it is treated as code unless it is quoted. The positions of items in the list are both syntactically and semantically meaningful when the list is evaluated as code.  These positions will be discussed below, in the section "Prefix Notation."

Lisp code is meant to be simple and elegant; if you find yourself staring into an impenetrable confusion of parenthesis-chaos, your code is too complex for you to manage.  Using techniques for decomposition and refactoring also presented in this book, you will learn how to write beautiful and elegant programs as well as the Common Lisp language itself.

## Lists, Cons-cells, and Memory

It is significant to separate the representation and implementation of S-Expressions in your mind as you learn Lisp---since McCarthy's first paper on LISP, S-Expressions have been defined by their *representation*, but in Common Lisp, S-Expressions are defined by their *implementation* and their representation is only treated as an interface to the underlying objects.

Lists are a proper type, descending from Sequences in Lisp's type hierarchy.  A list only *conses* as long as there are values to be consed. For example, consider the following:

```lisp
* (list)
=> NIL
* (list 'a)
=> (A)
* (list 'a nil)
=> (A NIL)
* (cons 'a nil)
=> (A)
```

To understand what's happening in the example above, you have to understand consing, and how lists are built on top of Cons-Cells.

```lisp
;; this:
(list 'a 'b 'c)
;; is the same as this:
(cons 'a (cons 'b (cons 'c nil)))
;; while this:
(list 'a 'nil)
;; is the same as this:
(cons 'a (cons nil nil))
```

The end of a chain of cons-cells normally terminates in `nil`, but you can have the `cdr` of a cons-cell point to a value too, and eliminate the need for an extra consing, by using dot-notation:

```lisp
;; this:
'(a . b)
;; is the same as this:
(cons 'a 'b)
```

A list of dot-notation pairs like this is called an association list, or `alist` for short.  They are one of many structures available in Lisp for storing key/value pairs, and have a good API.

```lisp
'((a . b)
  (c . d)
  (e . f))
```

So then, just what is this "Cons-Cell" I keep talking about, you ask?

A Cons-Cell is a pair of pointers, the `car` and the `cdr`---acronyms for "Contents of Address Register" and "Contents of Decrement Register", respectively.  The `car` is usually a pointer to a value, while the `cdr` can be a pointer to the `car` of another cons-cell, a pointer to `NIL`, or in the case of a dotted-pair, another pointer to a value.

Consider again the examples above. Now you can more clearly see how lists are built on top of Cons-Cell chains, and what is happening when you work with Cons-Cells directly:

```lisp
;; this creates three cons-cells, the quoted symbols 'A, 'B, and 'C each in the CAR of their own Cons-Cell
(list 'a 'b 'c)
;; it would be the same as typing this:
(cons 'a (cons 'b (cons 'c nil)))
;; or this:
'(a . (b . (c . nil)))
;; or this:
'(a b c . nil)
;; or simply this:
'(a b c)
```

A good deal of optimization of Lisp software is all about minimizing the number of conses performed by your code.  Note how a dotted-pair only conses once, while a two item list that contains the same information conses twice.

## Symbols and Namespaces

Common Lisp is often referred to as a LISP<sub>2</sub>---that is, it has separate namespaces for Functions and Variables in any given environment.  In practice, this means that you can bind and assign both a function and a variable to the symbol `foo`, evaluate `(foo foo)`, and Lisp can distinguish between them automatically, using the function definition when it's supposed to, and using the variable value when it's supposed to.  You can also explicitly refer to the function definition with the reader macro `#'`, such as in `(apply #'foo foo)`.

```lisp
(defvar foo 1)

(defun foo (foo)
  (+ foo foo))

(foo foo)
=> 2
```

Common Lisp is also both *dynamically* and *lexically* scoped. Dynamic scoping is special and explicit in Common Lisp; lexical scoping is more intuitive and implicit---in other words, you have to specifically declare a symbol to be special to use its dynamic binding from within a lexical scope where the symbol could be lexically bound and assigned as a different variable, while many forms introduce an implicit lexical scope.  For this reason there is a naming convention for top-level, dynamic variables: "earmuffs":

```lisp
;; top-level, dynamic variables can be declared with DEFVAR or DEFPARAMETER
(defvar *my-dynamic-var* "I'm special!")
=> *MY-DYNAMIC-VAR*
;; notice that the variable names are qualified with a pair of asterisks? These are called earmuffs.
(defparameter *my-extra-special-dynamic-var* "I'm special, too!")
=> *MY-EXTRA-SPECIAL-DYNAMIC-VAR*
;; one obvious way to introduce a lexical scope is with a LET form for binding and assigning lexical variables:
(let ((one 1)
      (two 2)
      (three 3))
  (+ one two three))
=> 6
;; now lets change things up a bit:
(defvar one 1.0)
=> ONE
(defun mad-adder (one)
  (declare (special one))
  (let ((one 1))
    (+ one (locally (declare (special one)) one))))
=> MAD-ADDER
(mad-adder one)
=> 2.0
```

With the in-line `(locally (declare (special ...)))` expression, you're overriding the lexical definition of the symbol `one` to use the dynamic definition.  So, thanks to the law of propagation of floats, you get a return value of `2.0` instead of just the integer `2`.  Also note, there are actually *two* dynamic variables named `one` in the function application of `mad-adder`.  Can you explain their scoping?

Common Lisp has *packages*, which allow you to specify custom read-tables for your environment.  When you define a package, you have to explicitly import symbols you want available in the package namespace---even the Common Lisp language itself; you can import all of a package's exported symbols into your new package at once with the `:use` keyword expression in the body of your package definition.

At the top of a Lisp file, for example, you might have a package definition something like this:

```lisp
(in-package :cl-user)

(defpackage #:my-new-package
  (:nicknames #:newpack)
  (:use :cl :cl-user)
  (:export #:mad-adder))

(in-package :my-new-package)
```

You could then continue defining your functions, variables, classes, methods, and other code in your new package, and specifically list the symbols you want to export as the package's public interface in the package definition's `:export` keyword expression. Notice that in this package definition, we've also given the package a nickname, `newpack`, and told it to `use` all the exported symbols from the COMMON-LISP and COMMON-LISP-USER packages in the MY-NEW-PACKAGE local read-table.

You can refer to symbols by using their full name---normally, when you type in a symbol name, you don't have to type the package namespace it's in as well.  Lisp assumes that a symbol you enter exists in the current package, unless you specifically tell it otherwise.  You *can* access any symbol in a package, even if its not exported, but generally speaking you should obey the implicit agreement to use a package's exported interface instead of meddling with the internals.

Given that you have now defined the `mad-adder` function in `my-new-package`, but you're working in the `cl-user` package, you might want to just call `mad-adder` directly---you'd get an error in this case, however, because the *full name* of `mad-adder` is actually `my-new-package:mad-adder` not `common-lisp-user:mad-adder`.  You can use the package nickname instead, which is a convenient way to save typing and still be explicit:

```lisp
;; this:
(newpack:mad-adder one)
;; is the same as:
(my-new-package:mad-adder one)
;; if a symbol isn't exported, however, you have to use two colons between the package and symbol
(new-pack::*my-private-var*)
```

There are some symbol names you can't use, however---at least not without trickery.  As a general rule, you cannot use any of the 978 external symbols in the COMMON-LISP package for either a function or a variable, even if that binding does not exist in the Common Lisp standard.  All the names of symbols exported by the COMMON-LISP package are *reserved*.

## Prefix Notation

An evaluated list expression has syntactically and semantically meaningful positions.  Remember, lists are implemented as Cons-Cells.  So the *car* of an evaluated list has to be a valid *operator*; the *cdr* of the evaluated list is itself a list of arguments to the operator called *parameters*.  In other words, the operator always comes first, and is not infixed between arguments, as would be the case in algebraic notation.  This is called "Polish Prefix Notation".

```lisp
;; Polish Prefix notation, the operator comes first:
(operator . (list of parameters))
```

For example, say you want to add together a list of numbers.  Normally, you would think to write this: `1 + 2 + 3 + 4 + 5 = 15`, infixing the operators between the arguments; but in Lisp you would write:

```lisp
* (+ 1 2 3 4 5)
=> 15
```

In Lisp, you don't have to write the addition operator, `+`, over and over between each number you wish to add together.  You are passing parameters to a function, and the function knows to collect the parameters as a set and Sum them.  That's the big conceptual difference between Lisp and other languages---when the operator comes first, you are telling the computer *what you want* instead of *what to do*.  So in the example above, you are telling Lisp you want the Sum of the set of integers from 1 to 5 inclusive, *not* telling it to add 1 to 2, then add the result to 3, then add the result to 4, and then add that result to 5, to get the integer 15.  Do you see the difference?

Valid operators can be a symbol representing a function, macro, or special operator; or a lambda expression representing an anonymous function. If it is a symbol, the Lisp evaluator will first check if the symbol is a special operator, and if it's not, it will look for a matching definition in the read-table for a function.  Macros are tricky---they can be expanded into normal Lisp code at various times; reader macros are expanded at read-time, while `defmacro` forms are expanded at compile time.  There are also various techniques for controlling when and where macros are to be expanded.

The handling of arguments is particular to the type of operator.  While functions, for example, can only receive a single return value from any parameter expressions, special operators have their own rules.  Macros allow you to arbitrarily change the syntax and semantics of Lisp---so, obviously, the rules are defined by the macro definition form itself.  Exactly how one should apply the raw power of macros is a subject of much debate in the Lisp community.

<ul class="pager">
  <li class="previous"><a href="/book/1-01-01-syntax-overview/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-01-03-style-guide/">Next &raquo;</a><li>
</ul>
