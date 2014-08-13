<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Extra Credit: Revisiting Loops with Iterate</li>
</ol>

## Chapter 1.17 --- Extra Credit

# Revisiting Loops with Iterate

> "People do what they want to, every time.  If it pains them to make a choice---if the choice looks like a 'sacrifice'---you can be sure that it is no nobler than the discomfort caused by greediness... the necessity of deciding between two things you want when you can't have both."
> <footer>Robert A. Heinlein, <em>Stranger In a Strange Land</em></footer>

Despite the power and expressiveness of the Loop Macro, a lot of Lisp Hackers simply hate it---naturally, in the roll-your-own-solution spirit of the Lisp community, many alternatives to the Loop Macro exist.  The most popular and Lispy of these is the ITERATE package.  It's aim is to provide all the power and expressiveness of the Loop Macro, without changing the fundamental syntax of the language for its own internal use---this implies, among other things of course, that you can build macros on top of Iterate and expand S-Expression code the way you normally would, instead of having to use strange hacks and bad style to achieve your desired effect with Loop.

Iterate is also extensible by design, so if it's missing some construct you happen to need, you can roll-your-own driver and use it like any other Iterate driver; or go the extra mile and package a number of Iterate extensions together in a contrib-library.  That's a feature that the built-in Loop macro can't provide.

After learning how to use the Iterate library and trying it out in a few projects, some Lisp Hackers still end up going back to Loop; but this is not an exercise in vain---learning Iterate and its strategy to iteration compared to the built-in Loop macro is an extremely useful exercise.  And at the end of this chapter, you will have a much better understanding of both Iterate and Loop, and which solution fits your needs the best.

This chapter will contain exercises on:

* Setting up your package to use Iterate
* A few side-by-side examples with Loop
* Iterate Clauses
* Iterate Drivers
* Variable Binding and Setting in Iterate
* Gathering Clauses
* Multiple Accumulations
* Parallel Binding and Stepping
* Types and Declarations

<ul class="pager">
  <li class="previous"><a href="/book/1-16-0-map-loop/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-18-0-format/">Next &raquo;</a><li>
</ul>
