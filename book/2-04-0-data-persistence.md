<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Extra Credit: Persistence and Databases</li>
</ol>

## Chapter 2.4 --- Extra Credit

# Persistence and Databases

> "You have attributed conditions to villainy that simply result from stupidity."
> <footer>Robert A. Heinlein, <em>Logic of Empire</em></footer>

All applications that allow a user to create or modify data must also allow that user to store their data somewhere, either on their own filesystem, on a server in the cloud, or in a database, and load it back into memory again.  After all, once an application quits, everything in its memory space is effectively lost.  To have that data persist across sessions, it has to be stored *somewhere*, and loaded back into an application's memory when it is needed.  Many strategies exist to achieve this---and we've looked at a couple simple ones already.

Another advantage of storing data outside of an application's memory space, is that it encourages you to validate all data before running it through your program.  In any real-world application, this should be done anyway; but when you know the data is coming from an untrusted source (*i.e.*, anyone who isn't you, the application developer), you're more likely to do things the right way.  While validation of all program input is a non-trivial task, it is essential for building robust user experiences that can handle bad user input as well as malicious attacks against your software.

Whether you store your application's data in a file on a user's computer or in a database where a number of authorized users can access it, you need to spend some time thinking about every piece of data that your application might need to store.  Imagine that the program is loading from scratch, and only has a saved file to restore everything from the last session to memory---if you've stored everything you need to, a user will be able to pick up right where they left off; if you missed anything, you might just annoy a user if it was nothing more than a trivial customization to the UI that you forgot to save, but you could just as easily crash the entire application and corrupt the user's data. Conversely, if data needs to be converted before being used, it's equally important to remember to convert both ways, on the way in, and on the way out.

Sometimes you may also want to serialize and store not just your data, but your code too---saving you the time and effort of rebuilding objects in memory from where they are stored.  This is possible in Lisp because of its homoiconicity.  Being able to treat code as data, and data as code can be just as much of a time-saver as it is a powerful tool for expressing code patterns in macros.  Again, careful thought has to be put into your complete application's life-cycle---if you store executable code, expecting it to run in your application, you'll have to validate it before allowing it to be evaluated. This brings up the principle of *secure programming*---writing software with certain best practices up front, instead of merely adding security features on at the end.

Lastly, you can also dump an entire Lisp session to your file system, and run it instead of having to load everything into memory again.  Everything you had in memory will be there again when you launch this dumped executable.  This can be useful if you have a lot of customizations, or default packages that you use all the time---but naturally, this too comes with its caveats.

## Exercise 2.4.1

**Validating Input**

```lisp

```

## Exercise 2.4.2

**More Validation**

```lisp

```

## Exercise 2.4.3

**Even More Validation**

```lisp

```

## Exercise 2.4.4

**Binary File Formats**

```lisp

```

## Exercise 2.4.5

**Outputting Binary Files**

```lisp

```

## Exercise 2.4.6

**Reading Binary Files**

```lisp

```

## Exercise 2.4.7

**Binary Files as Programs**

```lisp

```

## Exercise 2.4.8

**Hand Compilation**

```lisp

```

## Exercise 2.4.9

**Custom Lisp Images**

```lisp

```

## Exercise 2.4.10

**Dumping Custom Lisp Images**

```lisp

```

## Exercise 2.4.11

**Loading Custom Lisp Images**

```lisp

```

## Exercise 2.4.12

**Serializing Lisp Objects**

```lisp

```

## Exercise 2.4.13

**More Serialization**

```lisp

```

## Exercise 2.4.14

**Even More Serialization**

```lisp

```

## Exercise 2.4.15

**Relational Databases**

```lisp

```

## Exercise 2.4.16

**Document-based Databases**

```lisp

```

## Exercise 2.4.17

**Graph Databases**

```lisp

```

<ul class="pager">
  <li class="previous"><a href="/book/2-03-0-objects-control/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-05-0-extended-types.md">Next &raquo;</a><li>
</ul>
