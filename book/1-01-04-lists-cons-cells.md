<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Lists, Cons-Cells, and Memory</li>
</ol>

## Exercise 1.1.4

# Lists, Cons-Cells, and Memory

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

<ul class="pager">
  <li class="previous"><a href="/book/1-01-03-expressions/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-01-05-symbols/">Next &raquo;</a><li>
</ul>
