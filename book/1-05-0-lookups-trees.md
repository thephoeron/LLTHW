<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Extra Credit: Look-up Lists and Trees</li>
</ol>

## Chapter 1.5 --- Extra Credit

# Look-up Lists and Trees

> "Take sides! Always take sides! You will sometimes be wrong&mdash;but the man who refuses to take sides must <em>always</em> be wrong."
> <footer>Robert A. Heinlein, <em>Double Star</em></footer>

In addition to the typical lists you saw throughout the exercises of the previous chapter, Lisp also has a couple special types of look-up lists that have more structure than just position.  They are called Association Lists and Property Lists, or `alists` and `plists` for short.  They are typically used for data and not code, because they both consist of key--value pairs; but this is Lisp, after all, so there are packages where these special data lists are repurposed as code, and later on you'll see how to do similar things yourself if you ever need or want to.

If you have never come across the concept of key--value pair data structures before, they are straightforward to use and understand---all they do is assign a value you specify to a keyword, so that you can add them to a list and get the value back later by name instead of having to remember where in the list you put the value.  They are the basis for all structured data, including types such as Hash Tables, Structs, Classes, Database Tables, and more, all of which we'll be covering in this book.

This chapter will contain exercises on:

* Examples of ALISTS and PLISTS
* Creating PLISTS
* Adding items to PLISTS
* Changing values in PLISTS
* Removing items from PLISTS
* Creating ALISTS
* Adding items to ALISTS
* Removing items from ALISTS
* Practical size-constraints for ALISTS and PLISTS, alternate data types to look out for.
* Trees
* Acyclic Graphs

## Exercise 1.5.1

**Lookups: ALISTs and PLISTs**

`alist`s and `plist`s are two basic ways of representing linear-lookup key--value structures. An `alist` is a list of cons cells

```lisp
* '((a . 1) (b . 2) (c . 3))
((A . 1) (B . 2) (C . 3))
```

while a `plist` is a flat list of values, whose every odd element is a key and every even element is a value.

```lisp
* (list 'a 1 'b 2 'c 3)
(A 1 B 2 C 3)
```

Both constructs are of type `list`.

```lisp
* (listp '((a . 1) (b . 2) (c . 3)))
T

* (listp (list 'a 1 'b 2 'c 3))
T
```

Which is a double-edged blessing; any general list-processing function can transparently take `alist`s or `plist`s as arguments, but it's not easy to tell whether a particular construct is a plain `list` or a `plist`/`alist` (and there are cases where you *want* to treat them differently).

## Exercise 1.5.2

**PLISTs**

A `plist` is just a flat list with an even number of elements. Each odd element is taken to be the key of the immediately following element.

```lisp
* (list 'a 1 'b 2)
(A 1 B 2)

* (list :foo "a" :bar "b")
(:FOO "a" :BAR "b")
```

Calling the function `getf` on a `plist` and a key will try to find that key in the `plist`. If it is found, the return value will be that keys' value.

```lisp
* (getf (list :foo "a" :bar "b") :bar)
"b"

* (getf (list :foo "a" :bar "b") :foo)
"a"
```

The `getf` function also takes an optional argument, `default`, which it will return if the given key is not found in the given `plist`. The default `default` is `NIL`.

```lisp
* (getf (list :foo "a" :bar "b" :baz) :mumble)
NIL

* (getf (list :foo "a" :bar "b") :mumble 'great-googly-moogly)
GREAT-GOOGLY-MOOGLY
```

Trying this on an odd-length list might give you an error, even if you specify a default value.

```lisp
* (getf (list :foo "a" :bar "b" :baz) :foo)
"a"

* (getf (list :foo "a" :bar "b" :baz) :mumble)

  malformed property list: (:FOO "a" :BAR "b" :BAZ).
     [Condition of type SIMPLE-TYPE-ERROR]

* (getf (list :foo "a" :bar "b" :baz) :mumble 'tralala)

  malformed property list: (:FOO "a" :BAR "b" :BAZ).
     [Condition of type SIMPLE-TYPE-ERROR]
```

## Exercise 1.5.3

**More PLISTs**

Like all Cons-Cells, a `plist` can be heterogenously typed. That is, you can put many different types of things in it.

```lisp
* (list :a 1 :b 'two :c "three")
(:A 1 :B TWO :C "three")

* (getf (list :a 1 :b 'two :c "three") :b)
TWO

* (getf (list :a 1 :b 'two :c "three") :c)
"three"
```

This goes for the keys, as well as the values.

```lisp
* (list 1 :a 'two :b "three" :c)
(1 :A TWO :B "three" :C)

* (getf (list 1 :a 'two :b "three" :c) 1)
:A

* (getf (list 1 :a 'two :b "three" :c) 'two)
:B
```

However, be careful. `getf` tests its keys by pointer equality, and there's no way to specify otherwise. Which means that you can't *really* use compound structures as keys in a `plist`.

```lisp
* (getf (list 1 :a 'two :b "three" :c) "three")
NIL
```

## Exercise 1.5.4

**Even More PLISTs**

Its possible to mutate `plists`, as most other values, by using `setf`.

```lisp
* (defparameter *plist* (list :a 1 :b 'two :c "three"))
*PLIST*

* (getf *plist* :b)
TWO

* (setf (getf *plist* :b) 'three)
THREE

* (getf *plist* :b)
THREE

* *plist*
(:A 1 :B THREE :C "three")
```

The key you set this way doesn't need to exist already.

```lisp
* (setf (getf *plist* :d) 71)
71

* (getf *plist* :d)
71
```

but the order of new keys may surprise you, depending on your implementation, and what you expected.

```lisp
* *plist*
(:D 71 :A 1 :B THREE :C "three")
```

## Exercise 1.5.5

**ALISTs**

An `alist` is a list of Cons-Cells. The first element of each Cons-Cell is taken to be the key, while the rest is taken to be the value.

```lisp
* '((a . 1) (b . 2) (c . 3))
((A . 1) (B . 2) (C . 3))

* (list (cons :foo "a") (cons :bar "b"))
((:FOO . "a") (:BAR . "b"))
```

Calling the function `assoc` on a key and an `alist` will try to find that key in the `alist`. If it is found, the return value will be the whole Cons-Cell in question.

```lisp
* (assoc 'b '((a . 1) (b . 2) (c . 3)))
(B . 2)

* (assoc 'a '((a . 1) (b . 2) (c . 3)))
(A . 1)
```

Trying this on a malformed `alist`s may yield errors, though they won't be quite as specific as the ones thrown for malformed `plist`s.

```lisp
* (assoc 'a '((a . 1) (b . 2) c))
(A . 1)

* (assoc 'c '((a . 1) (b . 2) c))

  The value C is not of type LIST.
     [Condition of type TYPE-ERROR]
```

Specifically, this refers to that trailing `c` in our `alist`. This is because `assoc` compares the given key with the `car` of each element in the given list. If a particular element is not a `list`, you can't take its `car`, which means the selector will error.

## Exercise 1.5.6

**More ALISTs**

As with `plist`s, `alist`s may be heterogenously typed.

```lisp
* '((a . 1) (b . "two") (c . three) (d . #(#\f #\o #\u #\r)))
((A . 1) (B . "two") (C . THREE) (D . #(#\f #\o #\u #\r)))

* (assoc 'b '((a . 1) (b . "two") (c . three) (d . #(#\f #\o #\u #\r))))
(B . "two")

* (assoc 'd '((a . 1) (b . "two") (c . three) (d . #(#\f #\o #\u #\r))))
(D . #(#\f #\o #\u #\r))
```

and this again applies to both keys and values.

```lisp
* '((1 . a) ("two" . b) (three . c) (#(#\f #\o #\u #\r) . d))
((1 . A) ("two" . B) (THREE . C) (#(#\f #\o #\u #\r) . D))

* (assoc 'three '((1 . a) ("two" . b) (three . c) (#(#\f #\o #\u #\r) . d)))
(THREE . C)

* (assoc 1 '((1 . a) ("two" . b) (three . c) (#(#\f #\o #\u #\r) . d)))
(1 . A)
```

*Un*like with `plists`, compound keys might be useful. Because `assoc` accepts a `test` (or `test-not`) argument, you can specify the test to run when determining key equality.

```lisp
* (assoc "two" '((1 . a) ("two" . b) (three . c) (#(#\f #\o #\u #\r) . d)) :test #'equal)
("two" . B)

* (assoc #(#\f #\o #\u #\r) '((1 . a) ("two" . b) (three . c) (#(#\f #\o #\u #\r) . d)) :test #'equalp)
(#(#\f #\o #\u #\r) . D)
```

## Exercise 1.5.7

**Even More ALISTs**

## Exercise 1.5.8

**Efficiency, and Alternatives to ALISTs and PLISTs**

We mentioned earlier that the `alist` and `plist` were both representation of linear-lookup key--value structures. This is because they both work naively. That is, doing a lookup entails traversing the entire structure and comparing each key in turn until one matches the one we're looking for.

## Exercise 1.5.9

**Trees and Tries**

## Exercise 1.5.10

**More Trees and Tries**

## Exercise 1.5.11

**Object Reference**

## Exercise 1.5.12

**Circular Lists and Trees**

## Exercise 1.5.13

**Acyclic Graphs**

<ul class="pager">
  <li class="previous"><a href="/book/1-04-0-lists/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-06-0-math/">Next &raquo;</a><li>
</ul>
