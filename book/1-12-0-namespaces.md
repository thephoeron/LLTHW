<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Namespaces, Symbols, Packages, and Systems</li>
</ol>

## Chapter 1.12

# Namespaces, Symbols, Packages, and Systems

> "Every law that was ever written opened up a new way to graft."
> <footer>Robert A. Heinlein, <em>Red Planet</em></footer>

As briefly introduced in previous chapters, Common Lisp is a Lisp-2: that is to say, within any given package, you can use the same symbol to refer to both a function and a variable, if you like, because functions and variables have separate namespaces.  The namespaces for functions and variables are managed by the symbol object itself, which exist within a package.

Obviously, scope is important too.  A symbol inside a function body may not have the same definition as in the top-level.  This is by design---and whenever you use a symbol, it is important to remember dynamic and lexical scope.  Not all enclosing forms introduce a new lexical scope like `defun` does.

So, as you can see, what a symbol happens to mean is highly contextual---and for the most part, the Lisp reader is very good at figuring out which definition of a symbol you happen to mean in any given context.  When you want to stray from the norm, Lisp has tools to help you be more specific.

We will also cover some basic aspects of packaging your Lisp code for the wild, and working with ASDF and the Quicklisp package manager built on top of it.

## Exercise 1.12.1

**Dynamic and Lexical Scope, Revisited**

All symbols in Common Lisp are namespaced in packages, and within a namespace, symbols are also scoped.  *Scope* refers to how the Lisp reader looks up symbol definitions in the current environment.

### In the REPL

```lisp
(defparameter one #x01)

(let ((one 1))
  (let ((one 1.0))
    (let ((one "one"))
      (format t "~a~%" one))
    (format t "~a~%" one))
  (format t "~a~%" one))

(format t "#x~X~%" one)
```

### What You Should See

```lisp
* (defparameter one #x01)
ONE

* (let ((one 1))
    (let ((one 1.0))
      (let ((one "one"))
        (format t "~a~%" one))
      (format t "~a~%" one))
    (format t "~a~%" one))
one
1.0
1
NIL

* (format t "#x~2,'0,,X~%" one)
#x01
NIL
```

There are two flavours of scope---dynamic and lexical.  Lexical scope is tightly integrated with the structure of Lisp code and the lambda calculus from which it descends; it is *spatial* to the establishing form.  Dynamic scope is special, because it has indefinite scope and dynamic extent, which is to say that dynamically scoped symbols are not lexically contained to their establishing form and they live in the dynamic environment.

Remember that Lexical Scope *shadows* Dynamic scope, as well as surrounding lexical scopes.  Unless you specify otherwise, the innermost binding of a symbol is the one that is found by the Lisp reader.

## Exercise 1.12.2

**Implicit Lexical Scope**

Many forms in Common Lisp introduce an *implicit* lexical scope.  That is, you do not have explicitly call a `let` or `flet` to introduce a new nested scope; they provide a means for binding and assignment that is more intuitive for their particular use-case.  You have already seen a few of these forms, like the `DEFUN` macro.  You will also find implicit lexical scoping in `BLOCK` forms, and destructuring macros such as `DESTRUCTURING-BIND`, to name a few.

### In the REPL

```lisp
(block ta-da!
  (cond ((= (+ 1 1) 2)
         (return-from ta-da! t))
        ((= (+ 1 1) 3)
         (return-from ta-da! nil))
        (t
         (return-from ta-da! "Wait, what?"))))
```

### What You Should See

```lisp
(block ta-da!
  (cond ((= (+ 1 1) 2)
         (return-from ta-da! t))
        ((= (+ 1 1) 3)
         (return-from ta-da! nil))
        (t
         (return-from ta-da! "Wait, what?"))))
T
```

## Exercise 1.12.3

**Function and Variable Namespaces, Revisited**

Common Lisp has seprate namespaces for Functions and Variables.  This means that you can define a function and variable within the same dynamic or lexical scope that share the same symbol name, and Lisp will generally figure out on its own which you mean by its context---*i.e.*, where in an S-Expression the symbol appears.

### In the REPL

```lisp
(defparameter nonce 1.4)

(defun nonce (n)
  (* (random 128) n))

(inspect 'nonce)
> 2
> u
> 3
> 0
> u
> 1
> q
```

### What You Should See

You can inspect any object in Lisp.  When you inspect a symbol, you get its symbol table in the form of a menu with a new prompt, `>`.  This allows you to choose an entry in the table by number, and see more information about it.  You can return to the Common Lisp REPL by entering `q`, or navigate back up a level with `u`.  When you've defined both a variable and a function with the same name, you can then see them both in the symbol table and inspect every object that they consist of.

```lisp
(defparameter nonce 1.4)
NONCE

(defun nonce (n)
  (* (random 128) n))
NONCE

(inspect 'nonce)
The object is a SYMBOL.
0. Name: "NONCE"
1. Package: #<PACKAGE "COMMON-LISP-USER">
2. Value: 1.4
3. Function: #<FUNCTION NONCE>
4. Plist: NIL
> 2

The object is an ATOM:
  1.4
> u
...

> 3

The object is a FUNCTION named NONCE.
0. Lambda-list: (N)
1. Ftype: (FUNCTION (T) (VALUES NUMBER &OPTIONAL))
> 0

The object is a CONS.
0. CAR: N
1. CDR: NIL
> u
...

> 1

The object is a proper list of length 3.
0. 0: FUNCTION
1. 1: (T)
2. 2: (VALUES NUMBER &OPTIONAL)
> q
```

## Exercise 1.12.4

**First-Class Functions**

As mentioned in the previous exercise, Lisp will assume that when a symbol appears in the operator position of a list, it refers to a function, and when it appears in the lambda list, it refers to the variable value.  But Common Lisp supports first-class functions, so naturally there must be a way, in parameter position, for the Lisp reader to recognize when you mean the function namespace in parameter position.

This is the reader macro `#'`.  Prepend it to a symbol, and the Lisp reader will know to treat that parameter as a first-class function instead of as a variable.

### In the REPL

```lisp
(mapcar #'nonce '(128 123 118 113 108 103 98 93))
```

### What You Should See

```lisp
* (mapcar #'nonce '(128 123 118 113 108 103 98 93))
(13184 12300 10502 13786 3564 1751 4998 5115)
```

First-class functions are very different than a function application that happens to be in parameter position.  Lisp code is evaluated innermost-form first, so a form in source-code can almost always be replaced by its return value---and as far as Lisp is concerned, it is.  This is known in Comp-Sci parlance as "pass-by-value" or "call-by-value", which is to say that a form is actually evaluated to a result, and the result itself is passed to the parent form and copied---anything done to that value has no effect on the original.  For a function application, this doesn't mean much because the evaluation usually *computes* this original value in the first place---but for first-class function objects and variables, this is quite important.

## Exercise 1.12.5

**Symbol Names**

Symbol names are stored as case-sensitive strings in the symbol table.  Typically, the Lisp reader upcases symbol-names when a symbol is created unless forced to do otherwise, such as with the `INTERN` function.

### In the REPL

```lisp
(symbol-name 'pi)

(intern "myCamelCaseSymbol")

(symbol-name '|myCamelCaseSymbol|)

(symbol-name 'cl-user::|myCamelCaseSymbol|)

(export '|myCamelCaseSymbol|)

(symbol-name 'cl-user:|myCamelCaseSymbol|)
```

### What You Should See

```lisp
(symbol-name 'pi)
"PI"

(intern "myCamelCaseSymbol")
|myCamelCaseSymbol|
NIL

(symbol-name '|myCamelCaseSymbol|)
"myCamelCaseSymbol"

;; this symbol hasn't been exported yet, so we have to refer to it using package-internal namespacing
(symbol-name 'cl-user::|myCamelCaseSymbol|)
"myCamelCaseSymbol"

(export '|myCamelCaseSymbol|)
T

;; now that we've exported |myCamelCaseSymbol|, we can call it with package-external namespacing and import it into other packages
(symbol-name 'cl-user:|myCamelCaseSymbol|)
"myCamelCaseSymbol"

```

Symbols exist within packages, so their full name is prefixed with their package.  When your working package is the same namespace as where the symbol was interned, you can omit the package prefix---but it is still there.

## Exercise 1.12.6

**Packages**

In addition to the separate Function and Variable namespaces offered by Common Lisp, your code can be organized into *packages*.  Packages allow you to design an interface to your code-base under a common name, separating the functions, variables, and other units of code from the Common Lisp language and from other libraries; as a result, they can help eliminate symbol collision as well.

### In the REPL

```lisp
(defpackage my-new-package)

(in-package :my-new-package)

(cl:defparameter *hello-world*
  (cl:format cl:nil "Hello ~A!" 'multiverse))

(cl:export '*hello-world*)

(cl:in-package :cl-user)

my-new-package:*hello-world*
```

### What You Should See

```lisp

(defpackage my-new-package)
#<PACKAGE "MY-NEW-PACKAGE">

(in-package :my-new-package)
#<COMMON-LISP:PACKAGE "MY-NEW-PACKAGE">

(cl:defparameter *hello-world*
  (cl:format cl:nil "Hello ~A!" 'multiverse))
*HELLO-WORLD*

(cl:export '*hello-world*)
T

(cl:in-package :cl-user)
#<PACKAGE "COMMON-LISP-USER">

my-new-package:*hello-world*
"Hello MULTIVERSE!"

```

Note how in your new package, you have to explicitly namespace-resolve symbols from the Common Lisp package now in order to use them.  This can be both useful and irritating, so we will introduce how to use another package's exported symbols as if they were local symbols in a few exercises.

## Exercise 1.12.7

**More Packages: Nicknames**

You can give your packages shorter, alternative nicknames which can be used for namespace-resolution on symbols, instead of having to type the full package name every single time.  You have already seen this in the previous exercise, where you had to refer to Common Lisp functions and variables prefixed with `cl`.  This is a package nickname for the `COMMON-LISP` package.

### In the REPL

```lisp
(defpackage my-new-package
  (:nicknames :mnp :newpack))

(in-package :my-new-package)

(cl:defparameter *hello-world*
  (cl:format cl:nil "Hello ~A!" 'multiverse))

(cl:export '*hello-world*)

(cl:in-package :cl-user)

my-new-package:*hello-world*

mnp:*hello-world*

newpack:*hello-world*
```

### What You Should See

You define a package's nicknames inside the `defpackage` macro.  You can have as many nicknames as you want; but like package names themselves, they have to be unique.

```lisp
(defpackage my-new-package
  (:nicknames :mnp :newpack))
#<PACKAGE "MY-NEW-PACKAGE">

(in-package :my-new-package)
#<COMMON-LISP:PACKAGE "MY-NEW-PACKAGE">

(cl:defparameter *hello-world*
  (cl:format cl:nil "Hello ~A!" 'multiverse))
*HELLO-WORLD*

(cl:export '*hello-world*)
T

(cl:in-package :cl-user)
#<PACKAGE "COMMON-LISP-USER">

my-new-package:*hello-world*
"Hello MULTIVERSE!"

mnp:*hello-world*
"Hello MULTIVERSE!"

newpack:*hello-world*
"Hello MULTIVERSE!"
```

## Exercise 1.12.8

**More Packages: Exporting Symbols**

Technically, once a package and all its source code has been loaded into your Lisp image, you can call any unit of code within it by using the full symbol, `<package-name>::<symbol-name>`; but it is more convenient to export an interface to your users, which they can then *import* into their packages individually, or *use* your entire library's API.

You can export your defined units of code either with the `export` form, or specifying symbols to export in your package definition; if you try to export the same symbol twice, once from the package definition and again with `export` form, you'll trigger a condition.  Generally speaking it's considered best practice to export all your symbols from the package definition form, so that your library's API is clear and together in one place.

```lisp
(defpackage my-new-package
  (:nicknames :mnp :newpack)
  (:export #:*hello-world*))

```

## Exercise 1.12.9

**More Packages: Using Other Packages**

When you *use* a package in your package, you are telling Lisp to add all the exported symbols of that package to your current package-internal namespace, so that you can call any unit of code locally as if you defined it yourself in your current package.

At the very minimum, you will want to *use* the `COMMON-LISP` package, which has the `CL` nickname; and if you plan to do a lot of work at the REPL from your package, you will also want to *use* the `COMMON-LISP-USER` package, which imports all the extra default features of your Lisp implementation.  While you develop your library, it can be useful to call out units of code from other packages and libraries explicitly, so that there is no confusion on your dev team as to what code is being called---if you find that you're relying heavily enough on a library that typing out its package nickname before each symbol becomes tedious, annoying, and a source of existential woe, that is a good indicator the library should be *used*, and your full dev team deeply familiar with its interface.

```lisp
(defpackage my-new-package
  (:nicknames :mnp :newpack)
  (:use :cl :cl-user)
  (:export #:*hello-world*))

```

## Exercise 1.12.10

**More Packages: Importing Specific Symbols**

You won't always need to *use* a full library; more often than not, you will only need to import a handful of specific symbols.  This is another advantage of typing out the full symbol, package namespace included, while developing your library---you can search through your source code for references to a given package, and make a judgment call as to whether you need to use it or only import the symbols you need.  This helps to avoid cluttering your namespace, among other things.

```lisp

```

## Exercise 1.12.11

**More Packages: Shadowing-Imports**

Sometimes, you will come across naming collisions between libraries you need to use, which at first glance may seem to force you to manually import, symbol by symbol, everything from a library except the offender.  That's not very efficient, however, so Lisp has you covered---you can *shadow-import*, which lets you tell Lisp exactly which symbol from which package you want to favour in the case of a naming collision.

```lisp

```

## Extra Credit Exercise 1.12.12

**ASDF and Systems**

ASDF is, essentially, a build-system for Common Lisp---but that doesn't really do it justice.  For our purposes, it is a necessary tool for defining libraries for the Quicklisp package manager.

ASDF focuses on the concept of a *System*.  A System is a collection of Lisp source-code files, which may or may not include a number of packages, wrapped up with some meta-data.

ASDF Systems are typically defined in their own `*.asd` files, instead of `*.lisp`.  However, they are still written using Common Lisp syntax.

In your `~/quicklisp/local-projects/` directory, create a subdirectory called `my-new-project/`, and in it, create a new file called `my-new-project.asd`.  The contents of this file should look like the following, with the appropriate personalizations completed:

```lisp
(in-package :cl-user)

(defpackage my-new-project-asd
  (:use :cl :cl-user :asdf))

(in-package :my-new-project-asd)

(defsystem my-new-project
  :version "1.0.0"
  :license "MIT"
  :author "A.B. <a.b@example.org>")

```

## Extra Credit Exercise 1.12.13

**ASDF Systems: Dependencies**

ASDF allows you to specify library dependencies in your system definition; the project will then not compile unless these dependencies are available.  The Quicklisp package manager uses this information to automatically resolve all dependencies when quickloading a library.

If you *use* a library in any package within your project, you must include it in the system's `:depends-on` form, to ensure that it is available to your project wherever it is run or installed.

Revise `my-new-project.asd` to look like the following:

```lisp
(in-package :cl-user)

(defpackage my-new-project-asd
  (:use :cl :cl-user :asdf))

(in-package :my-new-project-asd)

(defsystem my-new-project
  :version "1.0.0"
  :license "MIT"
  :author "A.B. <a.b@example.org>"
  :depends-on (:ironclad))

```

## Extra Credit Exercise 1.12.14

**ASDF Systems: Files**

In the same directory as `my-new-project.asd`, create empty files for `packages.lisp` and `my-new-project.lisp`.

You don't have to specify that the files you're including in components are `*.lisp` files, you only have to specify their names, without the file extension.

Revise `my-new-project.asd` to look like the following:

```lisp
(in-package :cl-user)

(defpackage my-new-project-asd
  (:use :cl :cl-user :asdf))

(in-package :my-new-project-asd)

(defsystem my-new-project
  :version "1.0.0"
  :license "MIT"
  :author "A.B. <a.b@example.org>"
  :depends-on (:ironclad)
  :serial t
  :components ((:file "packages")
               (:file "my-new-project")))

```

## Extra Credit Exercise 1.12.15

**ASDF Systems: Modules**

*Modules* in ASDF system definitions correspond to subdirectories of your project folder.  Your modules may correspond to their own packages---and this is a common design pattern---but they don't have to.  This is fairly different from other programming languages, where project directory structure corresponds rigidly to namespacing.  Lisp is more flexible---you can span your entire project with a single package namespace, you can give each and every file its own package, or anywhere in-between.

The important thing to remember about ASDF is that it has no bearing on your project's namespace and organization.  It exists to collect metadata and compilation instructions---and it doesn't care about what packages you use, or how many.  It only needs to know where to find your source-code to compile it, in the right order.

Revise `my-new-project.asd` to look like the following:

```lisp
(in-package :cl-user)

(defpackage my-new-project-asd
  (:use :cl :cl-user :asdf))

(in-package :my-new-project-asd)

(defsystem my-new-project
  :version "1.0.0"
  :license "MIT"
  :author "A.B. <a.b@example.org>"
  :depends-on (:ironclad)
  :serial t
  :components ((:file "packages")
               (:module "src"
                :serial t
                :components ((:file "utils")
                             (:file "api")))
               (:file "my-new-project")))

```

## Extra Credit Exercise 1.12.16

**ASDF Systems: Serial mode vs. Dependency Tree**

```lisp

```

## Extra Credit Exercise 1.12.17

**The Quicklisp Package Manager**

Now that you have your new project configured for ASDF, you can automatically load it and all its dependencies into your current Lisp image through the Quicklisp package manager.

Quicklisp runs *inside* your Lisp image, not from the command-line.

It is considered best practice to not call Quicklisp inside your Lisp source-code, but to rely on ASDF and portable Common Lisp; for deploying executables, tools such as `BUILDAPP` will use Quicklisp automatically to retrieve dependencies and include them in your binary, without adding the overhead of the Quicklisp system to your binary.  The Lisp API to Quicklisp, however, is very useful for testing, exploring, and interactively programming with Lisp libraries from the REPL.  For example, you can now automatically load the library you've created in this chapter into a new Lisp image, and start playing with it right away.

```lisp
(ql:quickload :my-lisp-project)
To load "my-lisp-project":
  Load 1 ASDF system:
    my-lisp-project
; Loading "my-lisp-project"
..................................................
[package base58]..................................
[package cl-base64]...............................
[package nibbles].................................
[package ironclad]................................
..................................................
..................................................
..................................................
[package my-lisp-project]..
(PROVE MY-LISP-PROJECT)

(in-package :my-lisp-project)
#<PACKAGE "MY-LISP-PROJECT">


```

<ul class="pager">
  <li class="previous"><a href="/book/1-11-0-text-adventure/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-13-0-simple-web-app/">Next &raquo;</a><li>
</ul>
