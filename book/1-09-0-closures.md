<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Extra Credit: Closures</li>
</ol>

## Chapter 1.9 --- Extra Credit

# Closures

> "Everything is theoretically impossible, until it is done."
> <footer>Robert A. Heinlein, <em>The Rolling Stones</em></footer>

One of the neater features of Lisp that result from lexical scope are *Closures*---you may have even heard of them before, since "closure" has been a big buzz-word in the tech world lately---particularly in the Node.js community.  In the jargon of Computer Science, a Closure is a lambda expression (or, anonymous function), which has its open bindings bound in the lexical environment where it was defined.  For now, you can think of them as a means to preserve state in functional programming.

Closures were first developed to manually evaluate expressions in Lambda Calculus, and included as a language feature in the first version of Scheme. The feature was added to Common Lisp during the ANSI standardization process, and nowadays can be found in all Lisp-family languages.  Naturally, they are also fully supported in Erlang and Haskell.  This feature has become so popular in recent years that it has been adopted and shimmied into many other programming and scripting languages, including C++11, Java 8, JavaScript, EcmaScript, Smalltalk, ML, Ruby, Perl, Objective-C (and the Apple extensions to C and C++), C#, D, Swift, and to a limited extent, Python---although the S-Expression syntax of Lisp-family languages makes Closures far more natural to express than with the syntaxes of other languages.

In this chapter we will further explore the concepts of dynamic and lexical scope, introduce the concept of first-class functions, and walk through a number of interesting examples of Closures to make sure you have a good understanding of their use and potential.  You'll also get a sneak peak at functions, giving you more confidence in the material before you tackle the next chapter!

## Exercise 1.9.1

**Lexical Environments and Scope**

```lisp
;; let's look at lexical scoping
(let ((one 1))
  (let ((two (+ one one)))
    (let ((three (+ one two)))
      (let ((one 1.0))
        (+ one two three)))))
6.0
```

## Exercise 1.9.2

**LET Revisited**

```lisp
(let ((one 1)
      (two 2)
      (three 3))
  (- three two one))

```

## Exercise 1.9.3

**LET\*: Nested Lexical Scope**

```lisp
(let* ((one 1)
       (two (+ one one))
       (three (+ two one)))
  (* three three))
```

## Exercise 1.9.4

**Pure Functions**

* No side-effects
* No reliance on external state
* Same input => same output, every time

```lisp

```

## Exercise 1.9.5

**First-Class Functions**

Functions can be passed as an argument to another function.

```lisp
(map 'vector #'+ '(1 2 3 4) '(10 20 30 40))
```

## Exercise 1.9.6

**Functors: Function Objects**

```lisp

```

## Exercise 1.9.7

**LABEL and BLOCK**

```lisp

```

## Exercise 1.9.8

**Functions as Arguments**

```lisp

```

## Exercise 1.9.9

**Your First Closure**

```lisp

```

## Exercise 1.9.10

**Dancing Closures**

```lisp

```

## Exercise 1.9.11

**The Macroexpansion of DEFUN**

```lisp

```

## Exercise 1.9.12

**Extending Closures: Continuations**

```lisp

```

## Exercise 1.9.13

**Extending Closures: Partials**

```lisp

```

<ul class="pager">
  <li class="previous"><a href="/book/1-08-0-variables.md">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-10-0-functions.md">Next &raquo;</a><li>
</ul>
