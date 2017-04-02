<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-00-00-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Scientific Computing</li>
</ol>

## Chapter 3.13

# Scientific Computing

> "In this complex world, science, the scientific method, and the consequences of the scientific method are central to everything the human race is doing and to wherever we are going."
> <footer>Robert A. Heinlein, <em>The Pragmatics of Patriotism</em></footer>

Scientific computing, also known as Computational Science, is now considered a third mode of science in addition to the traditional two modes of observation/experimentation and theory, and is thus an essential basic skill for researchers of every scientific field.  Typically, computational scientists favour R, Mathematica, MATLAB, Python's SciPy and PDL libraries, C, or Fortran to implement highly optimized numerical simulations; but Common Lisp has significant advantages over all these technologies for implementing robust, optimized, distributed algorithms for modelling scientific problems, running simulations, and further optimizing scenarios.

At the most basic level, computational science requires featureful and fast algebra and plotting libraries; but advanced use-cases and computationally expensive simulations require massive concurrency, and resource intensive floating-point calculations.  Using LParallel, CL-GPU, GSLL, CL-PLPlot, and the optimization techniques you've already learned, you can beat the performance of other platforms and technologies, and take advantage of all of Common Lisp's other intrinsic features, such as interactive programming at the REPL, for rapid prototyping of solutions to many of the most important problems in computational science.

In this chapter we will review the Lisp syntax of the math necessary to model problems in computational science, translate a selection of problems in computational science from pseudo-code to Common Lisp, work heavily from the REPL to model systems interactively in real-time, graph and plot our results, and run exhaustive tests and benchmarks against other platforms as part of the optimization process, to prove to yourself and others that Common Lisp is the ideal platform for Scientific Computing.

## Exercise 3.13.1

**The Math of Scientific Computing**

```lisp

```

## Exercise 3.13.2

**GSLL**

```lisp

```

## Exercise 3.13.3

**Leveraging Massive Concurrency**

```lisp

```

## Exercise 3.13.4

**Floating-Point Calculations using CL-GPU**

```lisp

```

## Exercise 3.13.5

**Plotting Your Results**

```lisp

```

## Exercise 3.13.6

**Performance Testing and Optimization**

```lisp

```

## Exercise 3.13.7

**Proofing Results**

```lisp

```

## Project 3.13.8

**A Scientific Computing Application**

```lisp

```

<ul class="pager">
  <li class="previous"><a href="/book/3-12-00-fintech.md">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-14-00-computational-physics.md">Next &raquo;</a><li>
</ul>
