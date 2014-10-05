<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 1: Strings</li>
</ol>

## Exercise 1.2.1

# Strings

Strings are pretty important in programming; no matter what your program does, eventually you're going to need a string to send some information to the user of your program.

Some programming languages have a lot of different types of strings, but Lisp only has four: the standard `string` type, as well as `simple-string`, `base-string`, and `simple-base-string` types.  The usage of these other string types is fairly specialized, so normally you will be using the `string` type itself.

#### Creating Strings

The simplest way to create an object of type `string` in Lisp is to simply type it at the REPL or in a `*.lisp` file, using the double-quote syntax.

Try this at the REPL:

```lisp
* "this is a string"

* "this is another string"
```

#### What You Should See

When you type a string at the REPL and hit <kbd>Return</kbd> to evaluate it, Lisp treats the entire string as a single atom, even though underneath it is really a `sequence` of `character`s.  If you remember, an atom is anything that is not a Cons.  String objects are also self-evaluating objects.  Thus:

```lisp
* "this is a string"
=> "this is a string"
* "this is another string"
=> "this is another string"
```

<ul class="pager">
  <li class="previous"><a href="/book/1-02-00-input-output/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-02-more-strings/">Next &raquo;</a><li>
</ul>
