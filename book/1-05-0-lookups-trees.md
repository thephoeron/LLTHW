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

but the order of new keys may surprise you.

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

Specifically, that `error` refers to that trailing `c` in our `alist`. This is because `assoc` compares the given key with the `car` of each element in the given list. If a particular element is not a `list` (or `cons`), you can't take its `car`, which means the selector will error.

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

You can mutate `alist`s, just as you can mutate almost everything else.

```lisp
* (defparameter *alist* '((a . 1) (b . 2) (c . 3)))
*ALIST*

* (setf (cdr (assoc 'b *alist*)) 42)
42

* *alist*
((A . 1) (B . 42) (C . 3))
```

Though, unlike with `plist`s, the key you're mutating must already exist.

```lisp
* (setf (cdr (assoc 'foo *alist*)) 43)

  The value NIL is not of type CONS.
     [Condition of type TYPE-ERROR]
```

It is possible to add keys to an `alist`, but you need to be more explicit about it.

```lisp
* (push '(foo . 43) *alist*)
((FOO . 43) (A . 1) (B . 42) (C . 3))

* *alist*
((FOO . 43) (A . 1) (B . 42) (C . 3))
```

## Exercise 1.5.8

**Efficiency, and Alternatives to ALISTs and PLISTs**

We mentioned earlier that the `alist` and `plist` were both representation of linear-lookup key--value structures. This is because they both work naively. That is, doing a lookup entails traversing the entire structure and comparing each key in turn until one matches the key we're looking for...

```lisp
* (trace eq)
(EQ)

* (assoc 'b '((a . 1) (b . 2) (c . 3) (d . 4)) :test #'eq)
  0: (EQ B A)
  0: EQ returned NIL
  0: (EQ B B)
  0: EQ returned T
(B . 2)

* (assoc 'd '((a . 1) (b . 2) (c . 3) (d . 4)) :test #'eq)
  0: (EQ D A)
  0: EQ returned NIL
  0: (EQ D B)
  0: EQ returned NIL
  0: (EQ D C)
  0: EQ returned NIL
  0: (EQ D D)
  0: EQ returned T
(D . 4)
```

... or until we reach the end of the list.

```lisp
* (assoc 'foo '((a . 1) (b . 2) (c . 3) (d . 4)) :test #'eq)
  0: (EQ FOO A)
  0: EQ returned NIL
  0: (EQ FOO B)
  0: EQ returned NIL
  0: (EQ FOO C)
  0: EQ returned NIL
  0: (EQ FOO D)
  0: EQ returned NIL
NIL

* (untrace eq)
T
```

This is often Good Enough, but there are times when you care about lookup performance, and might be willing to sacrifice simplicity of implementation. No, we're not implementing `hash-table`s. They're already provided as part of the language (though that won't stop us later). Lets take a look at some tree structures.

## Exercise 1.5.9

**Trees**

If we pick keys so that we can *sort* them instead of merely comparing them for equality, we could use a tree structure rather than a plain list. Though we do need to do a bit more work. A tree is typically recursively defined as either

1. A value followed by two trees (a left branch and a right branch)
2. The terminal value (which marks the end of our tree)

Which we can represent as things like

```lisp
* '((1 . a) nil nil)
((1 . A) NIL NIL)

* '((2 . b) ((1 . a) nil nil) ((3 . c) nil ((4 . d) nil nil)))
((2 . B) ((1 . A) NIL NIL) ((3 . C) NIL ((4 . D) NIL NIL)))
```

This is not the only possible tree representation, nor necessarily the best. We'll reserve others for later on. You can see that our "value" is a key--value pair in the style of an `alist` and our terminal value is `NIL`. Also, note that our keys are sorted. That is, everything in the left branch of a particular tree has a *lesser* key than the "value" of that tree, while everything in the right branch has a *greater* key. This is the property that will let us do faster lookups. Ideally, it will let us cut half of the remaining search space out with each comparison.

Here's `lookup`:

```lisp
* (defun lookup (key sorted-tree)
    (let ((k (caar sorted-tree)))
      (cond ((null sorted-tree) nil)
	    ((> k key)
	     (lookup key (second sorted-tree)))
	    ((< k key)
	     (lookup key (third sorted-tree)))
	    (t
	     (first sorted-tree)))))
LOOKUP

* (trace lookup)
(LOOKUP)

* (lookup 4 '((2 . b) ((1 . a) nil nil) ((3 . c) nil ((4 . d) nil nil))))
  0: (LOOKUP 4 ((2 . B) ((1 . A) NIL NIL) ((3 . C) NIL ((4 . D) NIL NIL))))
    1: (LOOKUP 4 ((3 . C) NIL ((4 . D) NIL NIL)))
      2: (LOOKUP 4 ((4 . D) NIL NIL))
      2: LOOKUP returned (4 . D)
    1: LOOKUP returned (4 . D)
  0: LOOKUP returned (4 . D)
(4 . D)
```

Notice that we don't compare against all of the preceding elements in order to get to ours. We only compare against 3. A tree of four key--value pairs isn't the best demonstration of this, of course. 

## Exercise 1.5.10

**More Trees**

Since we're doing more work on trees, we may as well go [SICP](TODO link)-style and define the functional interface.

```lisp
* (defun tree (val left right) 
    (list val left right))
TREE

* (defun tree-value (tree) (first tree))
TREE-VALUE

* (defun tree-left (tree) (second tree))
TREE-LEFT

* (defun tree-right (tree) (third tree))
TREE-RIGHT

* (defun lookup (key tree)
    (if (null tree)
        nil
        (let ((k (car (tree-value tree))))
          (cond ((> k key) (lookup key (tree-left tree)))
                ((< k key) (lookup key (tree-right tree)))
                (t (tree-value tree))))))
; STYLE-WARNING: redefining COMMON-LISP-USER::LOOKUP in DEFUN
LOOKUP
```

Now that we have that, a naive `insert` looks like

```lisp
* (defun insert (key value tree)
    (if (null tree)
        (tree (cons key value) nil nil)
        (let ((k (car (tree-value tree))))
          (cond ((> k key) 
                 (tree (tree-value tree) 
                       (insert key value (tree-left tree))
                       (tree-right tree)))
                ((< k key)
                 (tree (tree-value tree)
                       (tree-left tree)
                       (insert key value (tree-right tree))))
                (t tree)))))
INSERT
```

We can use that insert on this specially-ordered `alist` to give us a reasonably balanced tree.

```lisp
* (defparameter *lst* '((5 . e) (3 . c) (4 . d) (2 . b) (1 . a) (7 . g) (6 . f) (8 . h) (9 . i) (10 . j)))
*LST*

* (reduce
    (lambda (memo pair)
      (insert (car pair) (cdr pair) memo))
    *lst* :initial-value nil)
((5 . E) ((3 . C) ((2 . B) ((1 . A) NIL NIL) NIL) ((4 . D) NIL NIL))
 ((7 . G) ((6 . F) NIL NIL) ((8 . H) NIL ((9 . I) NIL ((10 . J) NIL NIL)))))

* (defparameter *tree*
    (reduce
     (lambda (memo pair)
       (insert (car pair) (cdr pair) memo))
     *lst* :initial-value nil))
```

And, just so that we're comparing like-for-like, here's a recursive definition of `assoc`

```lisp
* (defun rec-assoc (key alist)
	(cond ((null alist) nil)
          ((eq key (caar alist)) (car alist))
          (t (my-assoc key (cdr alist)))))
REC-ASSOC
```

Now, lets compare lookup steps involved.

```lisp
* (trace lookup rec-assoc)
(LOOKUP REC-ASSOC)

* (rec-assoc 9 *lst*)
  0: (REC-ASSOC 9
                ((5 . E) (3 . C) (4 . D) (2 . B) (1 . A) (7 . G) (6 . F)
                 (8 . H) (9 . I) (10 . J)))
    1: (MY-ASSOC 9
                 ((3 . C) (4 . D) (2 . B) (1 . A) (7 . G) (6 . F) (8 . H)
                  (9 . I) (10 . J)))
      2: (MY-ASSOC 9
                   ((4 . D) (2 . B) (1 . A) (7 . G) (6 . F) (8 . H) (9 . I)
                    (10 . J)))
        3: (MY-ASSOC 9
                     ((2 . B) (1 . A) (7 . G) (6 . F) (8 . H) (9 . I) (10 . J)))
          4: (MY-ASSOC 9 ((1 . A) (7 . G) (6 . F) (8 . H) (9 . I) (10 . J)))
            5: (MY-ASSOC 9 ((7 . G) (6 . F) (8 . H) (9 . I) (10 . J)))
              6: (MY-ASSOC 9 ((6 . F) (8 . H) (9 . I) (10 . J)))
                7: (MY-ASSOC 9 ((8 . H) (9 . I) (10 . J)))
                  8: (MY-ASSOC 9 ((9 . I) (10 . J)))
                  8: MY-ASSOC returned (9 . I)
                7: MY-ASSOC returned (9 . I)
              6: MY-ASSOC returned (9 . I)
            5: MY-ASSOC returned (9 . I)
          4: MY-ASSOC returned (9 . I)
        3: MY-ASSOC returned (9 . I)
      2: MY-ASSOC returned (9 . I)
    1: MY-ASSOC returned (9 . I)
  0: REC-ASSOC returned (9 . I)
(9 . I)

* (lookup 9 *tree*)
  0: (LOOKUP 9
             ((5 . E)
              ((3 . C) ((2 . B) ((1 . A) NIL NIL) NIL) ((4 . D) NIL NIL))
              ((7 . G) ((6 . F) NIL NIL)
               ((8 . H) NIL ((9 . I) NIL ((10 . J) NIL NIL))))))
    1: (LOOKUP 9
               ((7 . G) ((6 . F) NIL NIL)
                ((8 . H) NIL ((9 . I) NIL ((10 . J) NIL NIL)))))
      2: (LOOKUP 9 ((8 . H) NIL ((9 . I) NIL ((10 . J) NIL NIL))))
        3: (LOOKUP 9 ((9 . I) NIL ((10 . J) NIL NIL)))
        3: LOOKUP returned (9 . I)
      2: LOOKUP returned (9 . I)
    1: LOOKUP returned (9 . I)
  0: LOOKUP returned (9 . I)
(9 . I)
```

The tree structure saves us a bit of work in a situation like this. And, if we can arrange for our lookup tree to be balanced or almost balanced, we'll save *more* work the bigger our data-set becomes.

##### TODO
- should we mention asymptotic notation and/or tail-call elimination here? I feel like both are pretty relevant, but not *exactly* in-scope.

## Exercise 1.5.11

**Tries**

If we can pick keys so that they're not merely sortable, but also *decomposable*, we can save a bit more time and space by using Tries *(As an aside, "Tree" and "Trie" are pronounced the same way. This is doubly annoying because, as you'll see in a moment, a Trie is a kind of Tree. So you can't even disambiguate by saying things like "Trie, the data structure". You'll sometimes hear Tries referred to as "Prefix trees", which may or may not help the situation)*.

A Trie is a node, a value and a (possibly empty) dictionary of nodes to Tries. Which can be represented as:

```lisp
* '(nil nil nil)
(NIL NIL NIL)

* '(nil nil ((#\o nil ((#\n nil ((#\e "one - the english name for the numeral 1")))))))
(NIL NIL
 ((#\o NIL ((#\n NIL ((#\e "one - the english name for the numeral 1")))))))
```

## Exercise 1.5.12

**More Tries**

## Exercise 1.5.13

**Object Reference**

## Exercise 1.5.14

**Circular Lists and Trees**

## Exercise 1.5.15

**Acyclic Graphs**

<ul class="pager">
  <li class="previous"><a href="/book/1-04-0-lists/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-06-0-math/">Next &raquo;</a><li>
</ul>
