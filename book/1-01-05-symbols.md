<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Symbols and Namespaces</li>
</ol>

## Exercise 1.1.5

# Symbols and Namespaces

Common Lisp is often referred to as a LISP<sub>2</sub>---that is, it has separate namespaces for Functions and Variables in any given environment.  In principle, this means that you can bind and assign both a function and a variable to the symbol `foo`, evaluate `(foo foo)`, and Lisp can distinguish between them automatically by their position in a form. You can also explicitly refer to the function definition in an argument position with the reader macro `#'`, such as in `(apply #'foo foo)`.  In practice, however, this is considered bad form.  Consider the example:

```lisp
(defvar foo 1)

(defun foo (foo)
  (+ foo foo))

(foo foo)
=> 2
```

There are actually three separate bindings of the symbol `foo` in the above example.  First, there is the global variable `foo` bound and assigned with `defvar` to the value of `1`.  There is the function definition of `foo`, and it has a parameter named `foo` as well.  In the body of `foo` the function, it is its parameter being added to itself; so when the function `foo` is applied to the global variable `foo`, you get `(+ 1 1) => 2`.

This is because in addition to having separate namespaces for Functions and Variables, Common Lisp is also both *dynamically* and *lexically* scoped. Dynamic scoping is special and explicit in Common Lisp; lexical scoping is more intuitive and implicit---in other words, you have to specifically declare a symbol to be special to use its dynamic binding from within a lexical scope where the symbol could be lexically bound and assigned as a different variable, while many forms introduce an implicit lexical scope.  For this reason there is a naming convention for top-level, dynamic variables, called "earmuffs":

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
;; now let's put them both together
(defvar *one* 1)
=> *ONE*
(let ((one 1.0))
  (+ one *one*))
=> 2.0
```

The "earmuffs" distinguish *special* variables from lexical.  Even though this is "just a convention", it's one you should be certain to follow.  The combination of separate namespaces for functions and variables, with both dynamic and lexical scoping of symbols, is extremely powerful---but it can easily get out of hand.  Distinguishing your special dynamic variables with the earmuffs will make a big difference.

Another excellent feature for taming the raw power of Common Lisp is its *package* system, which allow you to specify custom read-tables for your environment.  When you define a package, you have to explicitly import symbols you want available in the package namespace---even the symbols of the Common Lisp language itself; you can import all of a package's exported symbols into your new package at once with the `:use` keyword expression in the body of your package definition.

To fully explore the package system, go ahead and create a file called `ex1-1-5.lisp`, and enter the following code:

```lisp
(in-package :cl-user)

(defpackage #:my-new-package
  (:nicknames #:newpack)
  (:use :cl :cl-user)
  (:export #:mad-adder))

(in-package :my-new-package)

(defvar *my-private-var* "I'm not exported from the package")

(defun mad-adder (n &rest rest)
  "An addition function for MY-NEW-PACKAGE."
  (apply #'+ n rest))
```

You could then continue defining your functions, variables, classes, methods, and other code in your new package, and specifically list the symbols you want to export as the package's public interface in the package definition's `:export` keyword expression. Notice that in this package definition, we've also given the package a nickname, `newpack`, and told it to `use` all the exported symbols from the COMMON-LISP and COMMON-LISP-USER packages in the MY-NEW-PACKAGE local read-table.

Now back at the command line, navigate to the folder where you saved this file and, on Linux and OS X, run:

```sh
$ rlwrap sbcl --load "ex1-1-5.lisp"
```

While on Windows, run:

```sh
$ sbcl --load "ex1-1-5.lisp"
```

This will load and compile your source code file into the Lisp image, and as normal you will be dropped at the Lisp prompt in the `COMMON-LISP-USER` package.  If you ever need to check what package you're in, you can evaluate `*package*`.

You can refer to any bound symbol in the current Lisp image by using its full name---normally, when you type in a symbol name, you don't have to type the package namespace it's in as well.  Lisp assumes that a symbol you enter exists in the current package, unless you specifically tell it otherwise.  You *can* access any symbol in a package, even if it's not exported, but generally speaking you should obey the implicit agreement you make with the developers of a library to use their package's exported interface instead of meddling with the internals.

Given that you have now defined the `mad-adder` function in `my-new-package` and loaded the file, but you're working in the `cl-user` package when the REPL starts, you might think you can just call `mad-adder` directly---you'd get an error in this case, however, because the *full name* of `mad-adder` is actually `my-new-package:mad-adder` not `common-lisp-user:mad-adder`.  You can use the package nickname instead, which is a convenient way to save typing and still be explicit:

```lisp
;; this:
(newpack:mad-adder 1)
;; is the same as:
(my-new-package:mad-adder 1)
;; if a symbol isn't exported, however, you have to use two colons between the package and symbol
newpack::*my-private-var*
```

There are some symbol names you can't use, however---at least not without trickery.  As a general rule, you cannot use any of the 978 external symbols in the COMMON-LISP package for either a function or a variable, even if that binding does not exist in the Common Lisp standard.  All the names of symbols exported by the COMMON-LISP package are *reserved*.

<ul class="pager">
  <li class="previous"><a href="/book/1-01-04-lists-cons-cells.md">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-01-06-prefix-notation.md">Next &raquo;</a><li>
</ul>
