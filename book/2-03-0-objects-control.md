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

Structs and Classes in Lisp have *slots* for data, which are similar to *data members* or *class variables* in other object-oriented programming languages.  When defining a Struct or Class in Lisp, you are defining their slots. Generic functions and methods on classes are defined separately.  One might say that the main difference between Structs and Classes in Lisp is that Classes allow for this specialization of generics; but of course that is an overly simplistic comparison that masks the true distinction---the fundamental difference between Types and Classes in all programming languages.

You can always access the slots in a struct or class manually, but this is considered bad style---and sometimes it can even be dangerous.  As mentioned above, the Struct definition macro automatically creates accessors for all the slots you define; CLOS offers you a choice, and in so doing, allows you to create separate reader and writer methods, or a bi-directional accessor method.  CLOS classes also offer special initialization methods, and method wrapping, for fine-tuning control flow in the life-time of your objects.

CLOS, along with the Meta-Object Protocol, are considered the be-all and end-all of Object-Oriented Programming systems.  While they can be daunting at first, the design of CLOS is actually quite elegant and fits perfectly into the Lisp ecosystem---typically you will never need to worry about the MOP, but on those rare cases you do, you'll be glad it's there.

This chapter will contain exercises on:

* Blocks
* Tagbodys
* GO
* PROG, PROGN
* Structs
* CLOS
    * Classes
    * Generic Functions
    * Methods
    * :before and :after methods
    * MOP

<ul class="pager">
  <li class="previous"><a href="/book/2-02-0-regex/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-04-0-data-persistence/">Next &raquo;</a><li>
</ul>
