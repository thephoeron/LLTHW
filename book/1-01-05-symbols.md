<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Symbols and Namespaces</li>
</ol>

## Exercise 1.1.5

# Symbols and Namespaces

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

<ul class="pager">
  <li class="previous"><a href="/book/1-01-04-lists-cons-cells/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-01-06-prefix-notation/">Next &raquo;</a><li>
</ul>
