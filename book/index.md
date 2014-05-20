LLTHW
=====

Learn Lisp The Hard Way v0.2.0 alpha

"the Phoeron" Colin J.E. Lupton

Table of Contents
-----------------

* [Preface](preface/)
* [Introduction](introduction/)
* [Common Lisp Bootcamp](bootcamp/)
* [Common Lisp Style Guide](style-guide/)
* [Configuring Your Development Environment](configuration/)
    * Installing SBCL
    * Choosing a Text Editor
    * Working From the Command-Line
    * Tour of the REPL
* PART ONE: Grokking Lisp
    * [Syntax Overview in 5 minutes](1-1-0-syntax-overview/)
    * [I/O](1-2-0-input-output/)
        * [Strings](1-2-01-strings/)
        * [Characters](1-2-02-chars/)
        * [Writing](1-2-03-writing/)
        * [Printing](1-2-04-printing/)
        * [Pretty-Printing](1-2-05-pprint/)
        * [Reading](1-2-06-read/)
        * [EVAL](1-2-07-eval/)
        * [Working with Streams](1-2-08-streams/)
        * [Paths and Files](1-2-09-paths-files/)
        * [Prompting Users](1-2-10-prompts/)
    * [Lists and List-Operations](1-3-0-lists/)
        * Consing and Cons-Cells
        * Quoting Lists
        * Association Lists
        * Property Lists
        * Trees
    * [Numbers & Math]()
        * Numeric Types
        * Built-in Mathematical Functions
        * Arrays
        * Vectors
    * [Variables, Parameters, and Constants]()
        * Global Variables
        * Local Variables
    * [Functions and Macros]()
        * LAMBDA: Anonymous Functions
        * Global Functions
        * Local Functions
        * Recursive Functions
        * Defining Macros
    * [Extra Credit: A Simple Text Adventure]()
    * [Namespaces, Symbols, Packages, and Systems]()
        * Function and Variable Namespaces
        * Symbol Names
        * Defining Packages
        * ASDF and Systems
        * The Quicklisp Package Manager
    * [Extra Credit: Write a Simple Web Application]()
        * Sockets
        * Introducing Hunchentoot
        * Serving Static Files
        * Coding HTML5, CSS3, and JavaScript in Lisp
    * [Conditionals]()
        * IF, WHEN, UNLESS
        * COND
        * Predicates
    * [Extra Credit: Write a Command-Line Utility]()
        * Introducing CLON: The Command-Line Options Nuker
        * Loading Quicklisp in Lisp Scripts
        * Defining Your Application's Synopsis
        * Defining Your Application's Event Loop
        * Dumping Binaries
    * [Mapping and Looping]()
        * `DO` and `DO*`
        * `DOTIMES`
        * `DOLIST`
        * `MAP`
        * `MAPC` and `MAPL`
        * Other Mapping Functions
        * The `LOOP` Macro
    * [Extra Credit: Revisiting LOOPS with ITERATE]()
    * [Formatted Strings]()
        * The FORMAT Macro
        * Conditionals
        * Iteration
        * Numbers
        * Unprintable Objects
    * [Extra Credit: Write a Domain-Specific Language]()
    * [Part One in Review]()
* PART TWO: The Suffusion of Blue
    * [Programming Paradigms]()
        * The Multi-Paradigm Approach
        * Procedural Programming
        * Imperative Programming
        * Object-Oriented Programming
        * Functional Programming
        * Novel Paradigms
    * [Extra Credit: Threading, Memoization, and Parallel Processing]()
    * [Logic and Advanced Math]()
        * Logic Functions
        * Arrays
        * Vectors
        * Integer Functions
        * Floats
    * [Extra Credit: Using Regular Expressions in Lisp]()
    * [Objects and Control Structures]()
        * Blocks
        * Tagbodys
        * GO
        * PROG, PROGN
        * Structs
        * CLOS
    * [Extended Data-Types]()
        * Hash-Tables
        * Sequences
        * Sets
        * Type Definition
        * CLOS for Type Definition
    * [Extra Credit: An Improved Text Adventure Engine]()
    * [Conditions and Error Handling]()
    * [Extra Credit: Write a 2D Game]()
    * [The Compiler]()
        * Declaring Types
        * Controlling Compile-Time
        * Compiler Optimizations
    * [Documentation and Object Inspection]()
    * [Extra Credit: Using Foreign Libraries in Lisp]()
    * [Debugging Your Code]()
    * [Extra Credit: Write a Foreign Function Interface]()
    * [Essential Lisp Libraries]()
    * [Detailed Syntax Review]()
        * S-Expressions
        * Atoms
        * Lists
        * Quotes
        * Backtick Syntax
        * CLOS and the Meta-Object Protocol
* PART THREE: Lisp So(u)rcery
    * [Real-world Web Apps]()
    * [Native Mobile Applications]()
    * [Cross-platform Desktop Applications]()
    * [Drivers, Daemons, and System-Utilities]()
    * [Reverse Engineering]()
    * [Graphics Rendering]()
    * [OpenGL, SDL, and 3D Gaming]()
    * [Artificial Intelligence]()
    * [Audio Generation/Manipulation]()
    * [Cryptography/Security]()
    * [Scientific Computing]()
    * [Quantum Computing]()

FAQ
---

How long does this book take to complete?

: You should take as long as you need with each module to fully grasp the material.  It's not a race, and the only deadlines are the ones you set for yourself.

: Assuming you already have some programming experience and can do at least one module a day, you should expect to spend at least three months.

What kind of computer do I need?

: Common Lisp is available for nearly every platform, so any personal computer should do.
