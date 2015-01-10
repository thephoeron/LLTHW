<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Syntax Overview in 5 Minutes</li>
</ol>

## Exercise 1.1.1

# Syntax Overview in 5 Minutes

What makes the Lisp family of languages so simple, expressive, and concise, is the syntax.  First of all, everything in Lisp is an *object*---and all objects are represented by *S-Expressions*.

While other programming languages generally have unique syntactic forms for *statements*, which change a value in memory and return nothing, and for *expressions* which return a value, Lisp uses the S-Expression to represent all objects---all code and data, a property known as 'homoiconicity'.  As a result, all objects in Lisp have a return value when evaluated.

S-Expressions come from the Lambda Calculus, where they are formally defined to be either an *Atom* or a *List*.  In Lisp, lists of one or more elements are implemented as Cons-Cells, and atoms are thus any object which is not a cons.  Cons-Cells will be discussed more in [Exercise 1.1.2](/book/1-01-02-more-detail/).

Below are some examples of atoms---try them out at the REPL yourself!  And remember, type *exactly* what I've typed (even if you think it's wrong), pressing <kbd>Enter</kbd> at the end of each line.  This tells the Lisp REPL to evaluate the expression you've entered.

```lisp
94

'a-quoted-symbol

#\greek_small_letter_lamda

"This is a string"

nil

'()

()

t
```

As you can see, an *Atom* can be a lot of things in Lisp---numbers, symbols, character literals, strings, and even the empty list.  As you may have noticed, `nil`, `'()`, and `()` all return the same thing: `NIL`.  That is because `nil` is defined as the empty list, which itself is treated atomically as it doesn't require any consing.  But there's other trickery going on behind the scenes here too---strings, for example, while treated as Atoms, are actually *sequences* of character literals; lists are also a sub-type of sequences.

To really understand what's going on here, you have to remember that there's an object hierarchy---every object in Lisp descends from `t`---and again, *everything* is an object. The symbol `nil` is a special case, because it's the only member of the system class `null`. Only `nil` and its alternate representation, the empty list, represents logical falsity.  Every other object is truthy.  You don't *have* to return `t` to say that a function returns true, because any value other than `nil` is logically truthy, but it is useful when you need to return true and don't have any specific value to return.

A few of the examples above have a single quote prepended to them; this is just called *quoting*, and tells Lisp not to evaluate the quoted form.  You can think of this as switching an expression from code to data.  The prepended single quote is just a short form for a full `quote` expression. Let's look at some more specific examples of quoting expressions:

```lisp
'()

'(this is a list of symbols)

(quote (this is another list of symbols))

'another-quoted-symbol
```

Lists in Lisp are enclosed in a pair of parentheses.  If you've ever looked at Lisp source code before, and wondered, "What's up with all these parentheses?", you now have your answer.  Each nested object inside a list is a full S-Expression too, so in a given block of code, you can easily get a lot of parentheses at the end closing off all the nested objects represented as lists.

By default, as in "not-quoted", lists are automatically treated as code by Lisp when evaluated. We call these lists *forms*. Let's try it out:

```lisp
(+ 10 20 (* 30 2))

(princ "Hello, from Lisp!")

(loop for item in '(this list will get printed in titlecase) do (format t "~@(~A~) " item))
```

Don't worry too much about what you're typing at the moment---just make sure you type it exactly as I've typed it, and that it evaluates correctly.  What you should see is this:

```lisp
* (+ 10 20 (* 30 2))

90
* (princ "Hello, from Lisp!")
Hello, from Lisp!
"Hello, from Lisp!"
* (loop for item in '(this list will get printed in titlecase) do (format t "~@(~A~) " item))
This List Will Get Printed In Titlecase
NIL
*
```

Take a look at what you've typed and ponder it for a moment.  You should notice a few things right away:

* A form starts off with a function, macro, or special operator, typically represented by a symbol.
* The rest of the form is made up of parameters passed to that function, macro, or special operator.
* You can have other forms as parameters, and the innermost seem to get evaluated first; their *results* are then used as parameters to the form the next level up the hierarchy.

This syntax is called "Polish prefix-notation"---the operator comes first.  In the first example, `(+ 10 20 (* 30 2))`, it's pretty clear what's happening: you pass an arbitrary set of numbers to the addition function, and you get back the sum.  In this case, you also passed the *return result* of `(* 30 2)`, which is 30 multiplied by 2.  So instead of having to write something like `10 + 20 + 30 * 2` as you would in the algebraic notation of other programming languages, you just have to type the addition symbol once, and order of operation is clear.  For a simple example like this, it may not seem like a big deal yet, but for real-world applications, it greatly simplifies your code.

Typically the expression in the operator position of a form is a symbol that represents a named function; but it can also be an anonymous function, a macro, or special form.  Special forms have their own rules, and there's no means provided to define new special forms.  Macros, among other things, allow you to create custom syntax, allowing you to arbitrarily extend and change the Lisp language.  Typically, however, you will write functions, classes, and methods in your day-to-day code, which simply extend the semantics of the language.

There are also *reader macros*, which let you define convenient forms for expressing, among other things, new data types.  You've seen some reader macros already---like the short form of `quote`, represented by the single quotation mark prepending an expression to prevent it from being evaluated.

From this amazingly simple syntax, you can express any program you can imagine, using any programming paradigm you choose.

<ul class="pager">
  <li class="previous"><a href="/book/1-01-00-lisp-bootcamp/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-01-02-repl/">Next &raquo;</a><li>
</ul>
