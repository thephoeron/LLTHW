<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Conditionals</li>
</ol>

## Chapter 1.14

# Conditionals

> "Man is not a rational animal, he is a rationalizing animal."
> <footer>Robert A. Heinlein, <em>Assignment in Eternity</em></footer>

There are a lot of times when you need to control if, when, or how a particular piece of code will be evaluated. Your code, after all, could depend on some file existing on your computer before it can run; or it expects a very specific type of data to work right; or maybe you need a very specific value, like the command parser of the Text Adventure we wrote a few chapters earlier.  If you carefully consider your expectations ahead of time, and conditionalize your code accordingly, you can eliminate many common bugs before they become compiled into your application.

Conditionals are a loose, unofficial name for a subset of Control Flow functions in Common Lisp.  Their purpose is to force Lisp to pass a test before they hand over the code inside for evaluation---if the test fails, then the code within is ignored.  It's a simple idea, but an awfully important one.

These tests are called *Predicate Functions*.  All they ever do is return `t` or `nil`, which in this context you can read as the boolean values *True* or *False*.  Predicate Functions take one or more parameters that you want to test, and respond with the result of that test.  Of course, in Lisp, everything that isn't `nil` (or its equivalent, the empty list `'()`), is descended from `t` in the type/class hierarchy---so a test can also be any function that returns an object if successful, or `nil` if it fails.  This is useful, because it allows you to write a bare-bones simple test such as `(if monkey ...)`; if you've bound the symbol `monkey` as a variable, and assigned it a value, `monkey` is seen as `t`---but if you've bound it and assigned nothing to it, then it will return `nil`, the test will fail, and the `if` form will skip past the implicit 'then' expression and look for an 'else' expression.  The special operator `if` will be examined in detail later this chapter, after a deeper exploration of predicate functions.

All high-level programming languages have Conditionals by necessity for Turing Completeness---but Lisp really goes the extra mile, providing some unique conditional forms that you won't find elsewhere.  And where Lisp doesn't provide an out-of-the-box solution, it is surprisingly easy to write the predicate functions and conditional forms you desire.

This chapter will contain exercises on:

* Predicate Functions
* IF, WHEN, UNLESS
* COND
* CASE

Extra Credit exercises (mostly from Alexandria):

* Exclusive-Or predicate function
* An implementation of WHILE
* SWITCH
* Conditional lexical variable binding
* DESTRUCTURING-CASE

## Exercise 1.14.1

**Predicate Functions**

## Exercise 1.14.2

**Equality Predicates**

## Exercise 1.14.3

**Equality Predicates: EQ**

## Exercise 1.14.4

**Equality Predicates: EQL**

## Exercise 1.14.5

**Equality Predicates: EQUAL**

## Exercise 1.14.6

**Equality Predicates: EQUALP**

## Exercise 1.14.7

**Numerical Equality**

## Exercise 1.14.8

**IF Special Forms**

## Exercise 1.14.9

**WHEN Macro**

## Exercise 1.14.10

**UNLESS Macro**

## Exercise 1.14.11

**COND**

## Exercise 1.14.12

**CASE**

## Extra Credit Exercise 1.14.13

**Additional Conditional Forms in Alexandria**

## Extra Credit Exercise 1.14.14

**XOR Predicate**

## Extra Credit Exercise 1.14.15

**WHILE**

## Extra Credit Exercise 1.14.16

**Switches**

## Extra Credit Exercise 1.14.17

**Conditional Bindings**

## Extra Credit Exercise 1.14.18

**DESTRUCTURING-CASE**

<ul class="pager">
  <li class="previous"><a href="/book/1-13-0-simple-web-app.md">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-15-0-command-line-utility.md">Next &raquo;</a><li>
</ul>
