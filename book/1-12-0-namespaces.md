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

This chapter will contain exercises on:

* Dynamic and Lexical Scope
* Forms that introduce Lexical Scope
* Function and Variable Namespaces
* First-class Functions
* Symbol Names
* Defining Packages

Extra Credit Exercises (intro material, more detail in Chapter 2.20):

* ASDF and Systems
* The Quicklisp Package Manager

## Exercise 1.12.1

**Dynamic and Lexical Scope, Revisited**

```lisp

```

## Exercise 1.12.2

**Implicit Lexical Scope**

```lisp

```

## Exercise 1.12.3

**Function and Variable Namespaces, Revisited**

```lisp

```

## Exercise 1.12.4

**First-Class Functions**

```lisp

```

## Exercise 1.12.5

**Symbol Names**

```lisp

```

## Exercise 1.12.6

**Packages**

```lisp

```

## Exercise 1.12.7

**More Packages: Nicknames**

```lisp

```

## Exercise 1.12.8

**More Packages: Exporting Symbols**

```lisp

```

## Exercise 1.12.9

**More Packages: Using Other Packages**

```lisp

```

## Exercise 1.12.10

**More Packages: Importing Specific Symbols**

```lisp

```

## Exercise 1.12.11

**More Packages: Shadowing-Imports**

```lisp

```

## Extra Credit Exercise 1.12.12

**ASDF and Systems**

```lisp

```

## Extra Credit Exercise 1.12.13

**ASDF Systems: Dependencies**

```lisp

```

## Extra Credit Exercise 1.12.14

**ASDF Systems: Files**

```lisp

```

## Extra Credit Exercise 1.12.15

**ASDF Systems: Modules**

```lisp

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
