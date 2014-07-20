<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 9: More Printing</li>
</ol>

# Exercise 1.2.9

## More Printing

As I said in the previous exercise, Common Lisp has a lot of functions for printing, including one named `print`, which you'll see here in this exercise.  I'll also show you how the same functionality can be implemented with `write`, so you can get a feel for specializing a very general interface---a common development pattern in Common Lisp.

`print` works exactly as you would expect a print function to work.  You pass it an object to print and a stream to print it to. It prints the object between a new-line character and a space---note: `print` prints the object *readably*, in other words, in a format suitable to be read by the Lisp reader, escaping special characters.

Let's see it in action, along with an equivalent version using `write`:

```lisp
(print "hello, multiverse!")
(print "hello again, multiverse!" t)
(print "hello, multiverse, are you there?" nil)
(progn (terpri t)
       (write "hello, multiverse!" :stream t :escape t)
       (write-char #\Space t))
```

There are a few new things here, which we can go over quickly for now.  They will be explained in more detail later.

First, notice that the `print` function takes two arguments: the *object* you want to print, and then the *stream* you want to print the object to.  You can use the boolean truth symbol `t` as shorthand for `*standard-output*`.  You don't have to pass the second argument---the default is `nil`, so the first line of code is the same in principle as the third.

`progn` is a useful wrapper macro.  It tells Lisp to evaluate each expression in its body sequentially, in the order they appear.

`terpri` stands for "terminate printing".  It's used to send a new-line character to a stream.  It seems slightly illogical to use it at the *beginning* of a printing sequence, but that is how the `print` function is implemented.

For the `write` function, I've introduced two new keyword parameters, `:stream` and `:escape`, which tell `write` where to print the *object* parameter, and whether or not what's printed should be escaped, respectively.

Lastly, there is `write-char`, which is like `write`, but only prints a single character object to a stream.

#### What You Should See

```lisp
* (print "hello, multiverse!")

"hello, multiverse!"
"hello, multiverse!"
* (print "hello again, multiverse!" t)

"hello again, multiverse!"
"hello again, multiverse!"
* (print "hello, multiverse, are you there?" nil)

"hello, multiverse, are you there?"
"hello, multiverse, are you there?"
* (progn (terpri t)
         (write "hello, multiverse!" :stream t :escape t)
         (write-char #\Space t))

"hello, multiverse!" 
#\
```

Everything make sense?

A little word on the last example---notice how the return value of the whole `progn` form is different from `print`?  In Lisp, if you don't specify a return value (and in so doing, leave the expression early, before evaluation reaches the end), the return value of the last evaluated form in the expression is returned from the top-most expression.  In this case, `write-char` is the last expression in the `progn`, so *its* return value, `#\Space`, is returned by the `progn`.

Obviously, you'll notice, the `print` function is doing something different---but we'll get to that soon.

<ul class="pager">
  <li class="previous"><a href="/book/1-02-08-printing/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-10-prin1/">Next &raquo;</a><li>
</ul>
