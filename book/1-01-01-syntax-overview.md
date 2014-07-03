<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Syntax Overview in 5 Minutes</li>
</ol>

# Syntax Overview in 5 Minutes

> "Progress doesn't come from early risers---progress is made by lazy men looking for easier ways to do things."
> <footer>Robert A. Heinlein, <em>Time Enough For Love</em></footer>

What makes the Lisp family of languages so simple, expressive, and concise, is the syntax.  Using a single form, the *S-Expression*, you can represent all code and data.  This property is called 'homoiconicity'.

In Lisp, the S-Expression is defined to be either an *Atom* or a *List*.  An *Atom* is an S-Expression that evaluates to itself, while a *List* is a list of S-Expressions.

Below are some examples of atoms.  Try them out at the REPL yourself.  And remember, type *exactly* what I've typed (even if you think it's wrong), pressing 'Enter' at the end of each line.  This tells the Lisp REPL to evaluate the expression you've entered.

```lisp
94

'a-symbol

#\greek_small_letter_lamda

"This is a string"

nil

'()

t
```

As you can see, an *Atom* can be a lot of things in Lisp---numbers, symbols, character literals, strings, and even the empty list.  As you may have noticed, both `nil` and `'()` return the same thing: `NIL`.  That is because `nil` is defined as the empty list.  But there's other trickery going on behind the scenes here too---strings, for example, while treated as Atoms, are actually *sequences* of character literals, which makes them a sub-type of lists.  But by quoting a list, you can have Lisp treat it as an atom, so it evaluates to itself instead of being evaluated normally.  This is often referred to as switching to data mode.

Let's look at some more specific examples of quoting lists:

```lisp
'()

'(this is a list of symbols)

(quote (this is another list of symbols))
```

You can quote a list using the full expression, `(quote ...)`, or the short-form, `'...`.  Lisp sees it the same way.

Lists in Lisp are enclosed in a pair of parentheses.  If you've ever looked at Lisp source code before, and wondered, "What's up with all these parentheses?", you now have your answer.  Each nested S-Expression inside a list is a full S-Expression too, either an Atom or a List itself.

By default, as in "not-quoted", lists are automatically treated as code by Lisp and evaluated.  Let's try it out:

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

* A list in code starts off with a symbol that says what you want returned, often a function or macro name
* The rest of the list is made up of parameters passed to that function or macro
* You can have other lists as parameters, and the innermost seem to get evaluated first

This syntax is often referred to as "Polish prefix-notation".  In the first example, `(+ 10 20 (* 30 2))`, it's pretty clear what's happening: you pass an arbitrary set of numbers to the addition function, and you get back the sum.  In this case, you also passed the *return result* of `(* 30 2)`, which is 30 multiplied by 2.  So instead of having to write something like `10 + 20 + 30 * 2` in other languages, you just have to type the addition symbol once, and order of operation is clear.  For a simple example like this, it may not seem like a big deal yet, but for real-world applications, it greatly simplifies your code.

From this amazingly simple syntax, you can express any program you can imagine, using any programming paradigm you choose.

<ul class="pager">
  <li class="previous"><a href="/book/1-01-00-lisp-bootcamp/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-01-02-more-detail/">Next &raquo;</a><li>
</ul>
