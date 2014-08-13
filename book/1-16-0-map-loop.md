<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Mapping and Looping</li>
</ol>

## Chapter 1.16

# Mapping and Looping

> "Excuse me, Doctor; I did not mean to criticize your planet."
> <footer>Robert A. Heinlein, <em>The Moon Is a Harsh Mistress</em></footer>

As a contrast to Conditionals, sometimes you'll want to do exactly the same thing to each item in a whole list or sequence; or maybe not *exactly* the same thing, but very similar things. Once again, Lisp has you covered---there are quite a few built-in options for iteration over lists, sets, sequences, hash tables, and other such objects.  Basic iteration is covered by the "DO" series of functions.

Mapping is a different beast than iteration, but you may find a certain synchronicity between the two topics that help you understand both better. For example, if you have two lists, and you want to pair the values of one list with the values of the other, you can map them together using the `cons` function to get an alist as key-value pairs---and you can see here the similarity between mapping and looping.

Lisp also has the functions `apply` and `reduce`, of course---`apply` takes a function as its first argument, and then applies that function to the rest of the arguments you pass it; `reduce` is somewhat similar, but it works with sequences and allows you to specify a number of extra parameters for finer control.

And then there's the infamous and oft-criticized `LOOP` macro---it gets a lot of flak for not being "Lispy" enough, but it's so powerful that it's stuck around.  It has its own internal syntax that looks more like imperative languages than like Lisp, however, it includes the functionality for every possible iterative construct you could ever hope or dream for.

This chapter will contain exercises on:

* `DO` and `DO*`
* `DOTIMES`
* `DOLIST`
* `MAP`
* `MAPC` and `MAPL`
* Other Mapping Functions
* `APPLY` and `REDUCE`
* The `LOOP` Macro

<ul class="pager">
  <li class="previous"><a href="/book/1-15-0-command-line-utility/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-17-0-iterate/">Next &raquo;</a><li>
</ul>
