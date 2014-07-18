<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-0-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 8: Printing</li>
</ol>

# Exercise 1.2.8

## Printing

There are a lot of ways for a programmer to handle printing with Lisp, and all of them are built on top of the `write` function.  You will rarely need to use `write` directly, but it is useful to know about in order to understand all the different ways you can print objects in Lisp, and where to print them to.

Since the `write` function is extremely powerful and general, it takes a *lot* of parameters.  Most of them are *keyword parameters*, however, so you can call the function without knowing or using all of them, and trust that the standard has implemented sensible defaults for your use-case.

The simplest use of `write` is to call it with only one argument, what you want printed, according to the system defaults for printing that type of object:

```lisp
(write "hello")
(write 10)
(write 'hello)
```

But lets say you want to know how an integer is printed in hexadecimal, octets, or binary.  You can set the `:base` and `:radix` parameters to change the default behavior:

```lisp
(write 10000 :base 16 :radix t)
(write 10000 :base 8 :radix t)
(write 10000 :base 2 :radix t)
```

<div class="alert alert-info">
  The `:radix` keyword parameter is a generalized boolean.  This means that any "non-NIL" value you pass to it will be read the same as "True", even if you don't supply `t` itself.  The only time it will be treated as "False" is when you specifically pass it `NIL`.
</div>

#### What You Should See

```lisp
* (write "hello")
"hello"
"hello"
* (write 10)
10
10
* (write 'hello)
HELLO
HELLO
* (write 10000 :base 16 :radix t)
#x2710
10000
* (write 10000 :base 8 :radix t)
#o23420
10000
* (write 10000 :base 2 :radix t)
#b10011100010000
10000
```

Do you understand everything that's happening here?  Take a moment to review what you've typed, and what you've gotten back at the REPL.

With the first three examples, you probably noticed that you're getting back the same value twice.  This is because the default `:stream` is `*standard-output*`, which is the same place function return values are being sent while you're working in the REPL, and you're printing the objects with all their default settings, as Lisp would normally print them for you.  You won't normally see this behavior outside the REPL though---in upcoming exercises, you'll learn more about streams and what you can do with them, and what happens to values when they're not sent to a stream.

But notice how changing the defaults in the last three examples changed the way `write` *printed* the arguments, but didn't change the actual return value in any way (*i.e.,* the integer 10,000)?  This is how `write` works.  First it prints the *object* parameter you pass it, according to any changes you've made to the defaults using `write`'s keyword parameters, and then when it's done it *returns* the original object.

<ul class="pager">
  <li class="previous"><a href="/book/1-02-07-strings-from-chars/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-03-0-getting-input-from-users/">Next &raquo;</a><li>
</ul>
