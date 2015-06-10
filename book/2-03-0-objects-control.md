<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Objects and Control Structures</li>
</ol>

## Chapter 2.3

# Objects and Control Structures

> "Wisdom includes not getting angry unnecessarily. The Law ignores trifles and the wise man does, too."
> <footer>Robert A. Heinlein, <em>Job: A Comedy of Justice</em></footer>

Despite the common misconception that Lisp is a functional programming lanugage, Lisp has rich support for the Imperative and Object-Oriented paradigms---and these days, you'll find more fully Object-Oriented Lisp applications and libraries than purely-functional ones. While the tools for Imperative and Procedural programming are included alongside all the other standard features of Common Lisp, Object-oriented programming is encapsulated by CLOS: The Common Lisp Object System. As it turns out, you can also define CLOS classes and use them as types---but, fair warning, the inverse doesn't hold.

To differentiate from the purely-functional style, it will be helpful to introduce some new terminology as well.  Some of these terms are baked right into the language specification, while others are adopted simply for convenience.  Where official Lisp terminology differs from the mainstream, I will endeavour to make note of it.

First of all, when a function you write causes or relies upon side-effects in the dynamic scope, we will call that function a *procedure*.  Some of these are also called *destructive* or *in-place* operations, if they modify an object in memory instead of returning a new object.

In CLOS, Functions that are specialized for a particular class and its descendents are called *methods*.  Lisp also allows you to define unspecified *generic functions*, which act as a template for all methods of the same name in the current package.  Typically, one writes generic functions to establish the public and private API of a class for its package---while there is no special distinction in CLOS for public and private methods, you establish the public methods on a class by exporting those symbols from your package, as normal.

Structs in Lisp are essentially the same in principle and use as Structs in C, or Prototype Functions in JavaScript.  They're a quick and lightweight option when you just need a structured type to track state in your program; they are also useful for building full-blown state machines.  Defining a Struct comes with a lot of automatically generated code that is representative of the sane defaults that in other languages you would have to define manually, such as type predicates, constructors, copiers, readers and writers.  But the limitations of Structs can often be frustrating. Unless you're certain ahead of time that your application only needs the purposely limited feature-set of Structs, you should always start with CLOS.

Structs and Classes in Lisp have *slots* for data, which are similar to *data members* or *class variables* in other object-oriented programming languages.  When defining a Struct or Class in Lisp, you are defining their slots. Generic functions and methods on classes are defined separately.  One might say that the main difference between Structs and Classes in Lisp is that Classes allow for this specialization of generic functions; but of course, that is an over-simplification.  As you will come to see, there are many fundamental differences between structs and classes that will inform your choices while developing software in Lisp.

You can always access the slots in a struct or class manually, but this is considered bad style---and sometimes it can even be dangerous.  As mentioned above, the Struct definition macro automatically creates accessors for all the slots you define; CLOS offers you a choice, and in so doing, allows you to create separate reader and writer methods, or a bi-directional accessor method.  CLOS classes also offer special initialization methods, and method wrapping, for fine-tuning control flow in the life-time of your objects.

CLOS, along with the Meta-Object Protocol, are considered *the be-all and end-all* of Object-Oriented Programming systems, far improving on the object-oriented programming experience you'd get from SmallTalk, Java, C\#, C++, or Objective-C.  While they can be daunting at first, the design of CLOS is actually quite elegant and fits perfectly into the Lisp ecosystem---typically you will never need to worry about the MOP, but on those rare cases you do, you'll be glad it's there.

## Exercise 2.3.1

**Blocks**

## Exercise 2.3.2

**More Blocks**

## Exercise 2.3.3

**Macroexpand: Hidden Blocks**

## Exercise 2.3.4

**Tagbodys**

## Exercise 2.3.5

**GO**

## Exercise 2.3.6

**More Tagbodys and GO**

## Exercise 2.3.7

**PROGN**

## Exercise 2.3.8

**More PROGN**

## Exercise 2.3.9

**PROG, PROG\*, PROG1, and PROG2**

## Exercise 2.3.10

**PROGV**

## Exercise 2.3.11

**Structs**

## Exercise 2.3.12

**More Structs**

## Exercise 2.3.13

**Even More Structs**

## Exercise 2.3.14

**CLOS: Classes**

## Exercise 2.3.15

**CLOS: Slots**

## Exercise 2.3.16

**CLOS: More Slots**

## Exercise 2.3.17

**CLOS: Even More Slots**

## Exercise 2.3.18

**CLOS: Readers**

## Exercise 2.3.19

**CLOS: Writers**

## Exercise 2.3.20

**CLOS: Accessors**

## Exercise 2.3.21

**CLOS: Inheritance**

## Exercise 2.3.22

**CLOS: Multiple-Inheritance**

## Exercise 2.3.23

**CLOS: Generic Functions**

## Exercise 2.3.24

**CLOS: Methods**

## Exercise 2.3.25

**CLOS: More Methods**

## Exercise 2.3.26

**:BEFORE and :AFTER Methods**

## Exercise 2.3.27

**The Meta-Object Protocol**

<ul class="pager">
  <li class="previous"><a href="/book/2-02-0-regex/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-04-0-data-persistence/">Next &raquo;</a><li>
</ul>
