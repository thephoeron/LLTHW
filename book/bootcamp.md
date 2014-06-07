<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li class="active">Preface :: Common Lisp Bootcamp</li>
</ol>

# Common Lisp Bootcamp

> "I made a very important discovery at Camp Currie.  Happiness consists in getting enough sleep.  Just that, nothing more.  All the wealthy, unhappy people you've ever met take sleeping pills; Mobile Infantrymen don't need them."
> <footer>Robert A. Heinlein, Starship Troopers</footer>

It's time to dive head-first into Lisp, no mercy.  You'll need discipline to apply the five steps of learning the hard way, and this is where you'll get a feel for it.  But one thing you need to remember, which many programmers often forget before working themselves to burn-out, the most important thing you need to learn is to get a good night's sleep, every night, on time, so you can wake up fully refreshed to tackle Lisp again the next day.  Make yourself a schedule, a strict one, and follow it like you have a Sergeant throwing you out of your cot every morning, screaming at you all day to push yourself harder.  Eat right, take regular breaks from the computer, work hard, and sleep, and you'll find the learning process far more successful and rewarding.

There is a reason, after all, the military uses this methodology for training---it's an application of the metaphor of alchemy, realized in nuclear physics: given enough heat and pressure, you can in fact turn lead into gold. But now, on to Lisp.  Here is everything you need to know to get hacking in Lisp right this second.

## The REPL

The Lisp REPL is a READ-EVAL-PRINT Loop, and the core of the interactive approach to Lisp development.  You type in an expression, its evaluated, the return result is printed to standard out, and then it waits for more user input.  It is typically marked by a prompt, much like the command line for your operating system.  You can consider it as the main interface to the Lisp language.

Depending on the implementation of Lisp you are using, you may see different prompts.  You can also customize your prompt, if you like.

Typically, imagining that the underscore character below is your blinking cursor, you'll see something to the effect of:

```lisp
CL-USER> _
```

But in SBCL, the default prompt is much less informative:

```lisp
* _
```

For convenience sake, when you should enter a piece of code in the REPL for immediate evaluation, each line of code will be marked by the SBCL prompt character.  When you should enter all the code given in a file, there will be no prompt character preceding each line, and you will be provided with a file name to enter it in.

Remember, you don't type in the prompt character `*` at the REPL; even if your prompt looks different, the `*` symbolizes all Common Lisp REPL prompts.

## Expressions, Parentheses, and Return Values

In the pedantic spirit of programming, it is worth mentioning up-front that Lisp code is comprised entirely of expressions, and the language does not have statements.  Even a destructive, in-place operation is, while similar to the purpose of a statement in other languages, still an expression.  The difference is that an expression always returns something&mdash;even if that something is itself.

Expressions are of two kinds: atoms and lists.  An atom is a singular thing; when you enter it at the REPL as its own expression, it always returns itself.  A list, enclosed in a pair of parentheses, is literally no more than a list of expressions, which themselves could be either atoms or lists.  Unless a list is marked as data, it is treated as a function and evaluated according to its definition.

Lisp code is meant to be simple and elegant; if you find yourself staring into an impenetrable confusion of parenthesis-chaos, your code is too complex for you to manage.  Using the techniques for decomposition and refactoring presented in this book, you will learn how to write beautiful and elegant programs as well as the Common Lisp language itself.

## Prefix Notation

In Lisp, function-names and special operators come first in an expression, followed by their parameters.  This notation, called "Polish Prefix Notation", can take some getting used to, but once you get the hang of it, it actually makes a lot more sense.

For example, say you want to add together a list of numbers.  Normally, you would think to write this: `1 + 2 + 3 + 4 + 5 = 15`, but in Lisp you would write:

```lisp
* (+ 1 2 3 4 5)
```

And this expression would 'return' the integer `15`, which is typically written as `=> 15`.

In Lisp, you don't have to write the addition operator, `+`, over and over between each number you wish to add together.  You are passing parameters to a function, and the function knows to collect the parameters as a set and Sum them.

## Lists, Cons-cells, and Memory

In Lisp, lists are stored as chains of pointer-pairs, called "cons-cells".  Each cell either points to a memory address where a value is stored, or points to another cons-cell.  The first cell in the cons-cell is referred to as `car`, and the second cell is called `cdr`.  Since the names of the cells might seem strange to you, being artifacts of a long-lost hardware architecture, you can think of them as "first" and "rest" of a list, or the "head" and "tail" of a chain; but for reference, `car` stands for "Contents of Address Register", and `cdr` stands for "Contents of Decrement Register".

This may at first seem like useless and uninteresting historical trivia, but it is important to understand the underlying structure of the language, since a common problem you will face when writing Lisp software is minimizing the number of conses a function performs while executing its body.  You can easily waste a lot of memory and processing power dealing with unnecessary consing, and it is of fundamental importance to programming that you handle resources well. After all, a web-app you write in Lisp may work perfectly when you're testing it yourself, but scale poorly under heavy traffic and crash your server.  You can avoid embarrassing and stressful situations like this by keeping a careful accounting of system resources, ensuring that your software only ever uses the minimum amounts of memory and processor time necessary to keep your application live and running smoothly for everyone.

<ul class="pager">
  <li class="previous"><a href="/book/introduction/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/style-guide/">Next &raquo;</a><li>
</ul>
