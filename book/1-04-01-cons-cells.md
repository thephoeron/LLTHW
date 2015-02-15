<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-04-0-list/">Lists and List Operations</a></li>
  <li class="active">Cons-Cells</li>
</ol>

## Exercise 1.4.1

# Cons-Cells

You've already met them briefly in <a href="/book/1-01-04-list-cons-cells/">Lists, Cons-Cells, and Memory</a>. Cons-Cells are the smallest compound data structure in Lisp. One way to craft them is using the `cons` function.

```lisp
* (cons 'a 'b)
(a . b)
```

They can hold any type of data, not just symbols.

```lisp
* (cons 1 2)
(1 . 2)

* (cons "one" "two")
("one" . "two")
```

And they don't have to be heterogenous.

```lisp
* (cons 'a 2)
(a . 2)

* (cons 1 "two")
(1 . "two")
```

<ul class="pager">
  <li class="previous"><a href="/book/1-04-0-lists/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-04-02-consing/">Next &raquo;</a><li>
</ul>
