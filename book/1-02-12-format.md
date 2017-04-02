<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 12: A Brief Introduction to Format</li>
</ol>

## Exercise 1.2.12

# A Brief Introduction to Format

Pretty much every programming language has some way to insert arbitrary data into a string.  Lisp is no exception.  One difference, perhaps, is that in Lisp, the `format` function is a part of the language standard, and must be fully supported for the implementation to call itself Common Lisp.  In other languages, formatting strings is usually outside the scope of the core language, and only available through the standard library.

The `format` function in Lisp is so powerful, however, that I can only introduce you to a little bit of it right now.  The full treatise on this surprising core ANSI Common Lisp functionality will appear in Chapter 1.18, once you have a better grasp on key features of the language.

#### The Basics of Format

The `format` function uses a special type of string with its own internal syntax, called *control sequences*.  These control sequences are made up of the *tilde* (`~`) character and the *control character* itself, and may also include certain infix parameters which customize the behavior of the control sequence.

For example, a `format` control sequence you'll use often is `~A`, the *aesthetic* control sequence. It consumes an argument, and inserts that argument into the string, printed the same way that the `princ` function would print it. `~S`, the *standard* control sequence, consumes an argument and prints it the way `prin1` would print it. And `~W`, the *write* control sequence, consumes an argument and prints it the way that `write` would print it without any of its keyword parameters changed.

What do I mean by "consumes an argument" though?  Well, let me show you:

```lisp
(format nil "Hello, my name is ~A." "Colin")
```

This expression calls the `format` function, tells it to *return* the formatted string by setting the output stream to `nil`, and creates a format string that consumes one argument which will be printed aesthetically.  Following that is the one argument, a string with my name in it.

Now consider this example:

```lisp
(format nil "My name is ~A ~A." "Colin" "Lupton")
```

Now this example expects to consume *two* arguments.  And those two arguments follow, which are now my first and last names as separate string objects.

Now try these out:

```lisp
(format t "Hello, ~A!" "multiverse")

(format t "Hello, ~S!" "multiverse")

(format t "Hello, ~W!" "multiverse")
```

#### What You Should See

You should notice right away a few differences between `format` and the standard Lisp printer functions. You should see something like this:

```lisp
* (format nil "My name is ~A." "Colin")
"My name is Colin."
* (format nil "My name is ~A ~A." "Colin" "Lupton")
"My name is Colin Lupton."
* (format t "Hello, ~A!" "multiverse")
Hello, multiverse!
NIL
* (format t "Hello, ~S!" "multiverse")
Hello, "multiverse"!
NIL
* (format t "Hello, ~W!" "multiverse")
Hello, "multiverse"!
NIL
```

First up, notice that when you tell `format` to *return* the formatted string, you only get back one value now?  The return value alone.  But when you send the formatted string to `t`, which in the context of the `format` function's stream parameter is a shorthand for `*standard-output*`, you see that the formatted string is printed, and you get back a return value of `nil` instead of another string object.

Now notice that with the standard and write control sequences, the argument gets printed literally?  That is, it includes the double-quote syntax that would tell the Lisp Reader that this is a string object, if you were to have Lisp try and read such a string---but since there's other junk in the string that Lisp wouldn't understand, it's not a good idea to try.

<ul class="pager">
  <li class="previous"><a href="/book/1-02-11-princ/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-13-more-format.md">Next &raquo;</a><li>
</ul>
