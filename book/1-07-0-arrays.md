<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Extra Credit: Arrays and Vectors</li>
</ol>

## Chapter 1.7 --- Extra Credit

# Arrays and Vectors

> "As with any tool, merit <em>or</em> demerit lies in how it is used."
> <footer>Robert A. Heinlein, <em>Friday</em></footer>

When you need to squeeze extra efficiency out of your Lisp program, usually the first place to turn after minimizing consing-operations is to migrate your list data structures to arrays and vectors.  You will lose the flexibility of lists, but you do gain in performance and reduce memory usage.

Just like Lists, Arrays descend from the Sequence type, and vectors are a special type of array with only one dimension, so all sequence operations will also work on arrays and vectors.  List operations, however, will not.  Luckily, Common Lisp includes a number of utilities for working with arrays and vectors---and you should get to know them immediately so that you can start improving your codebase right away.

This chapter will contain exercises on:

* Sequences, Arrays, and Vectors
* Making Arrays
* Element-Types of Arrays
* Fixed-Size Arrays
* Extensible Arrays
* Fill-Pointers
* Splicing Arrays
* Splitting Arrays
* Concatenating Arrays
* Matrices
* Matrix Multiplication
* Octet Vectors
* Octet Vectors and Streams

## Exercise 1.7.1

**Sequences Revisited: Arrays and Vectors**

```lisp

```

## Exercise 1.7.2

**Arrays**

```lisp

```

## Exercise 1.7.3

**More Arrays: Element-Type**

```lisp

```

## Exercise 1.7.4

**More Arrays: Dimension**

```lisp

```

## Exercise 1.7.5

**More Arrays: Extensible**

```lisp

```

## Exercise 1.7.6

**More Arrays: Fill-Pointers**

```lisp

```

## Exercise 1.7.7

**Splicing Arrays**

```lisp

```

## Exercise 1.7.8

**Splitting Arrays**

```lisp

```

## Exercise 1.7.9

**Concatenating Arrays**

```lisp

```

## Exercise 1.7.10

**Matrices**

```lisp

```

## Exercise 1.7.11

**Matrix Multiplication**

```lisp

```

## Exercise 1.7.12

**Octet-Vectors**

```lisp

```

## Exercise 1.7.13

**More Octet-Vectors**

```lisp

```

## Exercise 1.7.14

**Vectors and Binary Streams**

```lisp

```

<ul class="pager">
  <li class="previous"><a href="/book/1-06-0-math/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-08-0-variables.md">Next &raquo;</a><li>
</ul>
