<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Lisp in More Detail</li>
</ol>

## Exercise 1.1.2

# Lisp in More Detail

> "A skillful Artist in shapes and appearances does no more than necessary to create His effect."
> <footer>Robert A. Heinlein, <em>Job: A Comedy of Justice</em></footer>

## The REPL

The Lisp REPL is a READ-EVAL-PRINT Loop, and the core of the interactive approach to Lisp development.  You type in an expression, the expression is *read*, *evaluated*, the return result is *printed*, and then it waits for more input.  The REPL is marked by a prompt, like the command line for your operating system, and it is the main interface to your current running Lisp image. Depending on the implementation of Lisp you are using, you may see different prompts.  You can also customize your prompt, but the means of doing so are implementation-dependent.

Typically, imagining that the underscore character below is your blinking cursor, you'll see something to the effect of:

```lisp
CL-USER> _
```

But in SBCL, the default prompt is much less informative:

```lisp
* _
```

For convenience sake, when you should enter a piece of code in the REPL for immediate evaluation, each line of code will be marked by the SBCL prompt character.  When you should enter all the code given in a file, there will be no prompt character preceding each line, and you will be provided with a file name to enter it in.

Remember, you don't type in the prompt character `*` at the REPL; even if your prompt looks different, the `*` *represents* all Common Lisp REPL prompts.

## Expressions, Parentheses, and Return Values

In the pedantic spirit of programming, it is worth reminding you that *everything* you type at the REPL or in your Lisp source code files will be *read as* or *expanded into* an S-Expression and evaluated if possible.  Quoting is one way you can disable evaluation for a nested S-Expression, but some S-Expressions are never evaluated.  If your Lisp implementation can't read what you've entered as a valid S-Expression, you will normally be dropped into the debugger.

Common Lisp only has S-Expressions; imperative programming languages, for example, differentiate between 'statements' and 'expressions', by ruling that statements cause changes to the environment and return nothing, while expressions are used for their return values.  In the tradition of the Lisp-family of programming languages, the syntax is minimalist by design---so in Lisp, even a destructive, in-place operation is represented as an S-Expression.

Expressions, in an abstract sense, are *expected to* return a value; S-Expressions in Common Lisp almost always do, as well, but there are some exceptions. These will be pointed out explicitly as they are brought up in the text of this book.

As was introduced in the previous exercise, an S-Expression can either be an *Atom* or a *Cons-Cell*.  Cons-Cells are represented by Lists to the Reader and by the Printer---but the empty list is treated as an Atom because it requires no consing.

A subset of Atoms are called *self-evaluating objects*.  Since expressions are expected to return a value, these particular objects simply return themselves.  By quoting an expression, you are effectively turning the quoted expression into a self-evaluating object.

Lists are ordered collections of S-Expressions surrounded in a pair of parentheses, with the items separated by whitespace---the *amount* of whitespace does not matter to the Lisp reader, but there are fairly strict style conventions on how to format your code which will be detailed in the next exercise.  Again, non-empty lists are read as cons-cells, and cons-cells are printed as lists.  But lists are also a proper data type in Lisp, so it's important to remember the distinction between *representation* and the actual *implementation*.

When a list is *evaluated*, it is treated as code unless it is quoted. The positions of items in the list are both syntactically and semantically meaningful when the list is evaluated as code.  These positions will be discussed below, in the section "Prefix Notation."

Lisp code is meant to be simple and elegant; if you find yourself staring into an impenetrable confusion of parenthesis-chaos, your code is too complex for you to manage.  Using techniques for decomposition and refactoring also presented in this book, you will learn how to write beautiful and elegant programs as well as the Common Lisp language itself.

## Lists, Cons-cells, and Memory

It is significant to separate the representation and implementation of S-Expressions in your mind as you learn Lisp---since McCarthy's first paper on LISP, S-Expressions have been defined by their *representation*, but in Common Lisp, S-Expressions are defined by their *implementation* and their representation is only treated as an interface to the underlying objects.

In Lisp, lists are stored as chains of pointer-pairs, called "cons-cells".  Each cell either points to a memory address where a value is stored, or points to another cons-cell.  The first cell in the cons-cell is referred to as `car`, and the second cell is called `cdr`.  Since the names of the cells might seem strange to you, being artifacts of a long-lost hardware architecture, you can think of them as "first" and "rest" of a list, or the "head" and "tail" of a chain; but for reference, `car` stands for "Contents of Address Register", and `cdr` stands for "Contents of Decrement Register".

This may at first seem like useless and uninteresting historical trivia, but it is important to understand the underlying structure of the language, since a common problem you will face when writing Lisp software is minimizing the number of conses a function performs while executing its body.  You can easily waste a lot of memory and processing power dealing with unnecessary consing, and it is of fundamental importance to programming that you handle resources well. After all, a web-app you write in Lisp may work perfectly when you're testing it yourself, but scale poorly under heavy traffic and crash your server.  You can avoid embarrassing and stressful situations like this by keeping a careful accounting of system resources, ensuring that your software only ever uses the minimum amounts of memory and processor time necessary to keep your application live and running smoothly for everyone.

## Symbols and Namespaces

Common Lisp is often referred to as a LISP<sub>2</sub>---that is, it has separate namespaces for Functions and Variables in any given environment.  In practice, this means that you can bind and assign both a function and a variable to the symbol `foo`, evaluate `(foo foo)`, and Lisp can distinguish between them automatically, using the function definition when it's supposed to, and using the variable value when it's supposed to.  You can also explicitly refer to the function definition with the reader macro `#'`, such as in `(apply #'foo foo)`.

Common Lisp is also both *dynamically* and *lexically* scoped.

Common Lisp has *packages*, which allow you to specify custom read-tables for your environment.

Reserved symbols.

## Prefix Notation

An evaluated list expression has syntactically and semantically meaningful positions.  Remember, lists are implemented as Cons-Cells.  So the *car* of an evaluated list has to be a valid operator; the *cdr* of the evaluated list are *arguments* or *parameters*.

Valid operators can be a symbol representing a function, macro, or special operator; or a lambda expression representing an anonymous function. If it is a symbol, the Lisp evaluator will first check if the symbol is a special operator, and if it's not, it will look for a matching definition in the read-table for a function.  Macros are tricky---they can be expanded into normal Lisp code at various times; reader macros are expanded at read-time, while `defmacro` forms are expanded at compile time.  There are also various techniques for controlling when and where macros are to be expanded.

The handling of arguments is particular to the type of operator.  While functions, for example, can only receive a single return value from any nested expressions in their argument positions, special operators have their own rules.  Macros allow you to arbitrarily change the syntax and semantics of Lisp---so, obviously, the rules are defined by the macro definition form.

In Lisp, a symbol representing a function, macro, or special operator, or a lambda expression representing an anonymous function, come first in an expression, followed by their parameters.  This notation, called "Polish Prefix Notation", can take some getting used to, but once you get the hang of it, it actually makes a lot more sense.

For example, say you want to add together a list of numbers.  Normally, you would think to write this: `1 + 2 + 3 + 4 + 5 = 15`, but in Lisp you would write:

```lisp
* (+ 1 2 3 4 5)
```

And this expression would 'return' the integer `15`, which is typically written as `=> 15`.

In Lisp, you don't have to write the addition operator, `+`, over and over between each number you wish to add together.  You are passing parameters to a function, and the function knows to collect the parameters as a set and Sum them.

<ul class="pager">
  <li class="previous"><a href="/book/1-01-01-syntax-overview/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-01-03-style-guide/">Next &raquo;</a><li>
</ul>
