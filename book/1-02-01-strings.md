<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-0-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 1: Strings</li>
</ol>

# Exercise 1.2.1

## Strings

Strings are pretty important in programming; no matter what your program does, eventually you're going to need a string to send some information to the user of your program.

Some programming languages have a lot of different types of strings, but Lisp only has two: the standard `string` type, and the rarely used `simple-string` type.

#### Creating Strings

The simplest way to create a string in Lisp is to simply type it at the REPL or in a `*.lisp` file, using the double-quote syntax.

Try this at the REPL:

```lisp
* "this is a string"

* "this is another string"
```

#### What You Should See

When you type a string at the REPL and evaluate it, Lisp treats the string as an atom, even though underneath it isn't.  If you remember, an atom is anything that is self-evaluated: it returns itself.  Thus:

```lisp
* "this is a string"
"this is a string"
* "this is another string"
"this is another string"
```

<ul class="pager">
  <li class="previous"><a href="/book/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/">Next &raquo;</a><li>
</ul>
