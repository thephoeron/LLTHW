<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 18: Prompting Users</li>
</ol>

## Exercise 1.2.18

# Prompting Users

Lisp has two built-in functions for prompting users, `y-or-n-p` and `yes-or-no-p`---they are *predicate* functions, in the sense that all they do is return `T` or `NIL`.  Unlike most other predicate functions you'll see, though, the argument you pass to them in code isn't what they're testing---it's a format string that goes to the user over `*query-io*`, and the test is applied to the user's input.

If you've used the command line at all before starting this book, you may have noticed a lot of command line applications will tell you what they're going to do, and ask you to confirm before it continues.  Something like, "Going to write your changes to a file.  Are you sure you want to continue? (Y or N)."  And then it waits for you to type the letter <kbd>Y</kbd> or <kbd>N</kbd> on the keyboard.

Both of these functions are similar in purpose, but `y-or-n-p` only expects the user to type one character on the keyboard.  `yes-or-no-p` expects the user to type the whole word "yes" or "no". In both cases, hit Return/Enter after to submit your response.

Naturally, feel free to substitute your own name in the the example below:

```lisp
(y-or-n-p "Is your name Colin?")

(yes-or-no-p "Are you sure?")

(y-or-n-p "Are you a ~S?" 'monkey)
```

### What You Should See

```lisp
* (y-or-n-p "Is your name Colin?")
Is your name Colin? (y or n) y

T
* (yes-or-no-p "Are you sure?")
Are you sure? (yes or no) yes

T
* (y-or-n-p "Are you a ~S?" 'monkey)
Are you a MONKEY? (y or n) n

NIL
```

Try each of these functions out a few times.  Ask any question you want in the string you pass to `y-or-n-p` and `yes-or-no-p`.

We will be looking at more involved prompts in Chapter 1.3, where your user can type more than just "y" or "n", or "yes" or "no".  But first, in the next exercise we'll take a look at Lisp's pretty-printer.

<ul class="pager">
  <li class="previous"><a href="/book/1-02-17-binary-streams/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-19-pretty-printing.md">Next &raquo;</a><li>
</ul>
