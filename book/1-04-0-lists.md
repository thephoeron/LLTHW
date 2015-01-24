<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Lists and List Operations</li>
</ol>

## Chapter 1.4

# Lists and List Operations

> "While the laws of statistics tell you how unlikely a particular coincidence is, they state just as firmly that coincidences <em>do happen</em>."
> <footer>Robert A. Heinlein, <em>The Door Into Summer</em></footer>

In the spirit of Lambda Calculus and a pure functional heritage, the Lisp-family of programming languages gets its name from its purpose---*LISt Processing*.  Even though Common Lisp is not a purely-functional programming language, its fundamental syntax has not deviated from this heritage; as you should remember from Chapter 1.1, Cons-Cells are one of two essential forms of Expressions in Lisp, and they are represented using List syntax; and since the other---Atoms---are, by definition, self-evaluating, everything interesting that you can do in Lisp is *effectively* a List operation.  And these are divided into *consing* and *non-consing* operations.

This is important to remember---it's the reason there are *so many* parentheses in Lisp source-code.  Every form surrounded by parentheses is a list. The only difference between code and data, syntactically speaking, is that *code is read and evaluated* whereas *data is only read*; you can switch to "data mode" by quoting an expression, but quoting isn't a free pass.  Lisp still expects to be able to *Read* the forms you've quoted as valid forms, so the syntax is just as important to data as it is to code.

This is also the key to Lisp's homoiconicity---the same syntax is used to represent both Code and Data, and as a result you can treat Code as Data, and Data as Code.  As far as Lisp is concerned, there is no difference between the two.

But Lists are also a proper type in Common Lisp, that descends from sequences.  We have already seen some sequence operations on other data types, like Strings, and will explore them further.  However, in this chapter, we will focus on Lists as a proper data type and Consing operations on these Lists.

This chapter will contain exercises on:

* Consing and Cons-Cells
* The LIST Function
* CAR and CDR
* FIRST, REST, and LAST
* PUSH and POP
* List Position
* APPEND
* Quoting
* Trees
* Acyclic Graphs

## Exercise 1.4.1

**Cons-Cells**

## Exercise 1.4.2

**Consing**

## Exercise 1.4.3

**Dot-Notation**

## Exercise 1.4.4

**More Consing**

## Exercise 1.4.5

**CAR and CDR**

## Exercise 1.4.6

**More CAR and CDR**

## Exercise 1.4.7

**Even More CAR and CDR**

## Exercise 1.4.8

**Lists**

## Exercise 1.4.9

**More Lists**

## Exercise 1.4.10

**Push**

## Exercise 1.4.11

**Pop**

## Exercise 1.4.12

**More Push and Pop**

## Exercise 1.4.13

**First, Rest, and Last**

## Exercise 1.4.14

**List Position**

## Exercise 1.4.15

**Appending**

## Exercise 1.4.16

**More Appending**

## Exercise 1.4.17

**Quoting**

## Exercise 1.4.18

**More Quoting**

<ul class="pager">
  <li class="previous"><a href="/book/1-03-0-getting-input-from-users/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-05-0-lookups-trees/">Next &raquo;</a><li>
</ul>
