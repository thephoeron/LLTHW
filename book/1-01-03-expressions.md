<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Expressions, Parentheses, and Return Values</li>
</ol>

## Exercise 1.1.3

# Expressions, Parentheses, and Return Values

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

<ul class="pager">
  <li class="previous"><a href="/book/1-01-02-repl/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-01-04-lists-cons-cells/">Next &raquo;</a><li>
</ul>
