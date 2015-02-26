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

* Consing and Cons-Cells
* The LIST Function
* CAR and CDR
* FIRST, REST, and LAST
* PUSH and POP
* List Position
* APPEND
* Quoting
* <strike>Trees</strike>
* <strike>Acyclic Graphs</strike>

## Exercise 1.4.1

**Cons-Cells**

Cons-Cells are the smallest compound data structure in Lisp. A Cons-Cell is effectively a pair of pointers. You can tell if what you're looking at is a Cons-Cell by using the predicate `consp`.

```lisp
* (consp 5)
NIL
* (consp "a")
NIL
* (consp 'a)
NIL
* (consp (cons 'a 'b))
T
```

## Exercise 1.4.2

**Consing**

One way to create a Cons-Cell is using the `cons` function.

```lisp
* (cons 'a 'b)
(A . A)
```

They can hold any `type` of data, not just symbols.

```lisp
* (cons 1 2)
(1 . 2)

* (cons "one" "two")
("one" . "two")
```

## Exercise 1.4.3

**Dot-Notation**

You can see that when we cons two atoms together, we get back a Dotted Pair. This is a `read`able representation of Cons-Cells. That is, you can use it directly, rather than calling `cons`.

```lisp
* (cons 'a 'b)
(A . B)
* '(a . b)
(A . B)
```

These two representations are equivalent.

```lisp
* (equal (cons 'a 'b) '(a . b))
T
```

## Exercise 1.4.4

**More Consing**

Cons-Cells need not contain homogenous data.

```lisp
* (cons 'a 2)
(A . 2)
* (cons 1 "two")
(1 . "two")
* (cons "a" 'b)
("a" . B)
```

## Exercise 1.4.5

**CAR and CDR**

Using Cons-Cells as building blocks would be kind of pointless if we couldn't get their components back out. To get the value of the first slot in a Cons-Cell, we use the `car` function.

```lisp
* (cons 'a 'b)
(A . B)
* (car (cons 'a 'b))
A
```

Similarly, we can get the value from the second slot in a Cons-Cell using `cdr`.

```lisp
* (cons 1 2)
(1 . 2)
* (cdr (cons 1 2))
2
```

## Exercise 1.4.6

**More CAR and CDR**

`cons`, `car` and `cdr` are purely functional. Which means they never mutate their arguments.

```lisp
* (defvar *a* (cons 1 2))
*A*
* *a*
(1 . 2)
* (cdr *a*)
2
* *a*
(1 . 2)
* (cons 3 (cdr *a*))
(3 . 2)
* *a*
(1 . 2)
```

It is an error to use `car` and `cdr` on something other than 

```lisp
* (car 1)
; Evaluation aborted on #<TYPE-ERROR expected-type: LIST datum: 1>
* (cdr 'a)
; Evaluation aborted on #<TYPE-ERROR expected-type: LIST datum: A>.
```

This includes other compound values such as strings and vectors

```lisp
* (car "a")
; Evaluation aborted on #<TYPE-ERROR expected-type: LIST datum: "a">.
* (cdr #(1 2))
; Evaluation aborted on #<TYPE-ERROR expected-type: LIST datum: #<(SIMPLE-VECTOR 2) {1007D4C76F}>>.
```

## Exercise 1.4.7

**Even More CAR and CDR**

The exception is the value `NIL`, which also represents the empty list.

```lisp
* (car nil)
NIL
* (cdr nil)
NIL
* (car ())
NIL
* (cdr ())
NIL
```

## Exercise 1.4.8

**Lists**

A list is either the empty list, or a chain of Cons-Cells ending with the empty list.

```lisp
* (listp nil)
T
* (listp (cons 5 nil))
T
```
If you cons something oneto the empty list, you get the list of that thing.

```lisp
* (cons 5 nil)
(5)
```
In this way, we can exploit the Cons-Cells' ability to contain heterogenous data in order to represent linked lists (or trees, as we'll see later).

```lisp
* (cons 3 (cons 2 (cons 1 nil)))
(3 2 1)
```

## Exercise 1.4.9

**More Lists**

Another way to create lists is using the `list` function.

```lisp
* (list 3 2 1)
(3 2 1)
```

The expression `(list a b ...)` is effectively shorthand for the expression `(cons a (cons b ...))`, with the final value being `cons`ed onto `NIL`.

```lisp
* (list 1 2 3)
(1 2 3)
* (cons 1 (cons 2 (cons 3 nil)))
(1 2 3)
* (equal (list 1 2 3) (cons 1 (cons 2 (cons 3 nil))))
t
```

## Exercise 1.4.10

**Push and Pop**

We mentioned before that `cons`, `car` and `cdr` are purely functional. But, sometimes, you want to destructively modify a list you've defined. For instance, in order to simulate a stack. In order to destructively `cons` elements onto a list, use `push`.

```lisp
* (defvar *stack* nil)
*stack*
* (push 1 *stack*)
(1)
* *stack*
(1)
* (push 2 *stack*)
(2 1)
* (push 3 *stack*)
(3 2 1)
* *stack*
(3 2 1)
```

## Exercise 1.4.11

**Pop**

The other half of the a stack involves destructively removing the first element from it. This can be done with `pop`.

```lisp
* *stack*
(3 2 1)
* (pop *stack*)
3
* *stack*
(2 1)
* (pop *stack*)
2
* (pop *stack*)
1
* *stack*
NIL
```

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
