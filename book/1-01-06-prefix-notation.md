<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Prefix Notation</li>
</ol>

## Exercise 1.1.6

# Prefix Notation

An evaluated list expression has syntactically and semantically meaningful positions.  Remember, lists are implemented as Cons-Cells.  So the *car* of an evaluated list has to be a valid *operator*; the *cdr* of the evaluated list is itself a list of arguments to the operator called *parameters*.  In other words, the operator always comes first, and is not infixed between arguments, as would be the case in algebraic notation.  This is called "Polish Prefix Notation".

```lisp
;; Polish Prefix notation, the operator comes first:
(operator . (list of parameters))
```

For example, say you want to add together a list of numbers.  Normally, you would think to write this: `1 + 2 + 3 + 4 + 5 = 15`, infixing the operators between the arguments; but in Lisp you would write:

```lisp
* (+ 1 2 3 4 5)
=> 15
```

In Lisp, you don't have to write the addition operator, `+`, over and over between each number you wish to add together.  You are passing parameters to a function, and the function knows to collect the parameters as a set and Sum them.  That's the big conceptual difference between Lisp and other languages---when the operator comes first, you are telling the computer *what you want* instead of *what to do* and *how to do it*.  So in the example above, you are telling Lisp you want the Sum of the set of integers from 1 to 5 inclusive, *not* telling it to add 1 to 2, then add the result to 3, then add the result to 4, and then add that result to 5, to get the integer 15.  Do you see the difference?

Valid operators can be a symbol representing a function, macro, or special operator; or a lambda expression representing an anonymous function. If it is a symbol, the Lisp evaluator will first check if the symbol is a special operator, and if it's not, it will look for a matching definition in the read-table for a function.  Macros are tricky---they can be expanded into normal Lisp code at various times; reader macros are expanded at read-time, while `defmacro` forms are expanded at compile time.  There are also various techniques for controlling when and where macros are to be expanded.

The handling of arguments is particular to the type of operator.  While functions, for example, can only receive a single return value from any parameter expressions, special operators have their own rules.  Macros allow you to arbitrarily change the syntax and semantics of Lisp---so, obviously, the rules are defined by the macro definition form itself.  Exactly how one should apply the raw power of macros is a subject of much debate in the Lisp community.

<ul class="pager">
  <li class="previous"><a href="/book/1-01-05-symbols/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-01-07-style-guide.md">Next &raquo;</a><li>
</ul>
