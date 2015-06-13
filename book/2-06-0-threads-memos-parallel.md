<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Extra Credit: Concurrency and Memoization</li>
</ol>

## Chapter 2.6 --- Extra Credit

# Concurrency and Memoization

> "I think the major problem in growing up is to become sophisticated without becoming cynical."
> <footer>Robert A. Heinlein, <em>I Will Fear No Evil</em></footer>

While John McCarthy had intended that the successor to the many different dialects of Lisp in the 70s and 80s would be a fully parallelized Lisp, his proposal for QLISP did not make it into the ANSI Common Lisp standard.  Nevertheless, many libraries for threading and full concurrency exist for Common Lisp, and achieve the same ends.

Now, Memoization is a really useful tool to have that ties in well with the subject of concurrency.  Memoization is a technique for caching the results of expensive computations, so that when a function is called again with the same arguments as one that has been memoized, it can pull the result from a cache instead of computing the function all over again.  The usefulness of this scales exponentially against the computational difficulty of your program on one axis and the number of times you have to call the same function with the same arguments in a given session of your application on another.

Lastly, we will wrap up our first tour of concurrency in this chapter with a look at general asynchronous operations and event-oriented programming techniques. Using this, we will then create a very simple asynchronous web application!

## Exercise 2.6.1

**Threads**

## Exercise 2.6.2

**More Threads**

## Exercise 2.6.3

**Even More Threads**

## Exercise 2.6.4

**Memoization**

## Exercise 2.6.5

**More Memoization**

## Exercise 2.6.6

**Even More Memoization**

## Exercise 2.6.7

**Concurrency**

## Exercise 2.6.8

**More Concurrency**

## Exercise 2.6.9

**Even More Concurrency**

## Exercise 2.6.10

**Asynchronous Web Applications**

## Exercise 2.6.11

**Event Loops**

## Exercise 2.6.12

**Routes**

## Exercise 2.6.13

**Promises**

## Exercise 2.6.14

**Futures**

<ul class="pager">
  <li class="previous"><a href="/book/2-05-0-extended-types/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-07-0-logic-and-more-math/">Next &raquo;</a><li>
</ul>
