<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Lists and List Operations</li>
</ol>

# Lists and List Operations

> "While the laws of statistics tell you how unlikely a particular coincidence is, they state just as firmly that coincidences <em>do happen</em>."
> <footer>Robert A. Heinlein, <em>The Door Into Summer</em></footer>

In the spirit of Lambda Calculus and a pure functional heritage, the Lisp-family of programming languages gets its name from its purpose---List Processing.  Even though Common Lisp is not a purely-functional programming language, its fundamental syntax has not deviated from this heritage; as you should remember from Chapter 1.1, Lists in Lisp are one of two essential forms of Expressions; and since the other---Atoms---are, by definition, self-evaluating, everything interesting that you can do in Lisp is *effectively* a List operation.

This is important to remember---it's the reason there are *so many* parentheses in Lisp source-code.  Every form surrounded by parentheses is a list. The only difference between code and data, syntactically speaking, is that *code is read and evaluated* whereas *data is only read*; you can switch to "data mode" by quoting an expression, but quoting isn't a free pass.  Lisp still expects to be able to read the forms you've quoted, so the syntax is just as important to data as it is to code.

This is also the key to Lisp's homoiconicity---the same syntax is used to represent both Code and Data, and as a result you can treat Code as Data, and Data as Code.  As far as Lisp is concerned, there is no difference between the two.

This chapter will contain exercises on:

* Consing and Cons-Cells
* The LIST Function
* CAR and CDR
* FIRST, REST, and LAST
* APPEND
* Quoting
* Trees
* Acyclic Graphs

<ul class="pager">
  <li class="previous"><a href="/book/1-03-0-getting-input-from-users/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-05-0-lookups-trees/">Next &raquo;</a><li>
</ul>
