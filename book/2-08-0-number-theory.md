<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Extra Credit: Number Theory</li>
</ol>

## Chapter 2.8 --- Extra Credit

# Number Theory

> "Some people insist that 'mediocre' is better than 'best.' They delight in clipping wings because they themselves can't fly. They despise brains because they have none. Pfah!"
> <footer>Robert A. Heinlein, <em>Have Space Suit---Will Travel</em></footer>

Number Theory is a fun, but challenging domain for computer scientists---many aspects of it pose intractable problems for classical computation, forcing us to look to novel technologies for solutions, such as Quantum Computation.  But in the age of concurrency, there are some minor tweaks and adjustments that can be made to the established algorithms, so that while we still cannot efficiently factorize the multiplication of two large primes, we can at least push classical computing to its absolute limit.

Through the excercises in this chapter, we will put together a Number Theory library that can be included in other projects, and contains a number of useful techniques for algorithm design, optimization, unit testing, and further develops on the iterative, incremental development pattern encouraged in Lisp.  We will approach each problem from its theoretical ideal, and then work towards a computational ideal that is as efficient as possible while retaining elegance in expression.

Cover functionality for a Number Theory library:

* Testing for Primality
* Factorization
* Polynomials
* Modular Exponentiation
* Inverse Modulus
* The Jacobi Function
* The Euler Totient Function
* The Carmichael Functions

This chapter will also contain exercises on:

* Profiling your code performance
* Laying out your Lisp libraries

<ul class="pager">
  <li class="previous"><a href="/book/2-07-0-logic-and-more-math/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-09-0-binary-octets-bits/">Next &raquo;</a><li>
</ul>
