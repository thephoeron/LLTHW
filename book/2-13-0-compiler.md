<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">The Compiler</li>
</ol>

## Chapter 2.13

# The Compiler

> "I will accept the rules that you feel necessary to your freedom. I am free, no matter what rules surround me. If I find them tolerable, I tolerate them; if I find them too obnoxious, I break them. I am free because I know that I alone am morally responsible for everything I do."
> <footer>Robert A. Heinlein, <em>The Moon Is a Harsh Mistress</em></footer>

One of the great things about Lisp is that you can write a full application with clean, straightforward, simple, dynamic code that always gives you exactly what you mean---and in fact, that's what we've been doing so far; full-scale applications written this way won't be particularly performant and they'll be memory-hogs, but they will work, without you needing to worry about such things as Garbage Collection, static type declarations, memory allocation and deallocation, so on and so forth.  But at this stage of development, your application isn't *done*.  It's just a prototype.

Another great thing about Lisp is that you can also optimize your applications to the point of absurdity, achieving twice the performance as heavily optimized C code---such as was done with the CL-PPCRE library.  That's what we'll be covering here---all the tools that the Common Lisp compiler offers that you'll need to milk your computer for every last GHz.

We will also be covering relevant techniques for profiling the performance of your code-base, minimizing extraneous consing, reviewing the disassembly of your compiled code, and static type declarations.  And from here on out, we'll adopt all these techniques for subsequent exercises.

## Exercise 2.13.1

**TIME**

```lisp

```

## Exercise 2.13.2

**Profiling with SB-PROFILE**

```lisp

```

## Exercise 2.13.3

**Profiling with SB-SPROF**

```lisp

```

## Exercise 2.13.4

**Consing**

```lisp

```

## Exercise 2.13.5

**Less Consing**

```lisp

```

## Exercise 2.13.6

**Even Less Consing**

```lisp

```

## Exercise 2.13.7

**Static Typing**

```lisp

```

## Exercise 2.13.8

**DECLARE**

```lisp

```

## Exercise 2.13.9

**PROCLAIM**

```lisp

```

## Exercise 2.13.10

**DECLAIM**

```lisp

```

## Exercise 2.13.11

**EVAL-WHEN**

```lisp

```

## Exercise 2.13.12

**DISASSEMBLE**

```lisp

```

## Exercise 2.13.13

**Garbage Collection**

```lisp

```

## Exercise 2.13.14

**More Garbage Collection**

```lisp

```

## Exercise 2.13.15

**Even More Garbage Collection**

```lisp

```

## Exercise 2.13.16

**Purifying Lisp Images**

```lisp

```

<ul class="pager">
  <li class="previous"><a href="/book/2-12-0-2d-game/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-14-0-tree-shaker.md">Next &raquo;</a><li>
</ul>
