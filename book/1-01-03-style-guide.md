<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Common Lisp Style Guide</li>
</ol>

## Exercise 1.1.3

# Common Lisp Style Guide

> "Anyone who considers protocol unimportant has never dealt with a cat."
> <footer>Robert A. Heinlein, <em>The Cat Who Walks Through Walls</em></footer>

Style is fundamental to programming&mdash;particularly in Lisp, where the unlimited power and flexibility of paradigm can easily go to your head.  A little carelessness can make for sloppy, illegible code; but if you make a point to consider your code as an art-form as well as a tool to get a job done, you, and anyone else who has to read your code later, will thank you for it.

But don't make the mistake of thinking these rules are prescriptive; and not everyone in the Lisp community agrees with them.  Consider them more like practical suggestions which will get you thinking about style, and then you and your team can decide together which style rules you want to follow for your coding aesthetic.

At this stage of learning Lisp, you may not fully appreciate all the style rules given here, or understand everything being discussed.  And that's okay.  Take a deep breath, and familiarize yourself with these points to the best of your ability, and then treat this chapter like a reference; it will mean more and more after each chapter of this book you work through, and will be something you can keep referring to with each Lisp project.

## Symbols and Naming

Clear and meaningful symbol-names in your Lisp programs are one of the most important aspects of code readability.

While there are no hard-fast rules for naming symbols in the Common Lisp standard, beyond a list of which characters are allowed, certain conventions have arisen in the Lisp community which you should know, and usually follow religiously.  There are times when you can, and may have to, break convention, but those are special cases which require experience and finesse.

Symbol names should be descriptive, short, typed in all lowercase, with words separated by a single hyphen:

```lisp
(defun my-addition-function (&rest rest)
  (apply #'+ rest))
=> MY-ADDITION-FUNCTION

(deftype my-integer-type ()
  '(and integer
        (satisfies plusp)))
=> MY-INTEGER-TYPE

(defvar my-hash-table (make-hash-table :test 'equal))
=> MY-HASH-TABLE

(defvar my-alist '(("one" . 1)
                   ("two" . 2)
                   ("three" . 3)))
=> MY-ALIST

;; Note that symbol names created from strings should be in all-caps:
(intern "MY-NEW-INTERNED-SYMBOL")
=> MY-NEW-INTERNED-SYMBOL
   NIL
;; or you'll have to reference it in surrounding hbars as a literal, case-sensitive symbol:
(intern "my-funky-interned-symbol")
=> |my-funky-interned-symbol|
   NIL
```

Note that a pair of hbars is *syntactic*, not stylistic.  It allows you, among other things, to define case-sensitive symbols; but it is generally only used for foreign-function interfaces.

Global variables, *i.e.*, variables declared as top-level forms with `defvar` or `defparameter`, are named using "earmuffs" because they are dynamic and special, such as the following built into Common Lisp:

```lisp
*package*
=> #<PACKAGE "COMMON-LISP-USER">
*print-base*
=> 10
```

In the case of earmuffs, these *are* stylistic.  They are not parsed as syntactic tokens by the Lisp reader, they are simply read as part of the symbol name.

Another stylistic convention for symbol names uses a pair of plus-signs to wrap symbol-names of *constants*:

```lisp
(defconstant +my-new-constant+ 1.0)
```

Package internal symbols are sometimes named with a prepended percent-sign, and not exported with the package API.  These are similar in purpose to private functions, methods, and variables in other programming languages---only they can always be accessed by using the full symbol name:

```lisp
(defpackage #:my-new-package
  (:use :cl)
  (:export #:mad-adder))

(in-package :mad-adder)

;; Do some wonky stuff with a package-internal function
(defun %madder (x)
  (declare (integer x))
  (apply #'+ (loop for i from 1 upto x
                   collect (* x i))))

;; Write an exported interface to your package internal function
(defun mad-adder (x)
  "Call %MADDER with integer argument X."
  (%madder x))

(in-package :cl-user)

(mad-adder:mad-adder 10)

(mad-adder::%mad-adder 10)
```

Predicate functions, *i.e.*, boolean tests, typically end with a suffixed "p".  If it is a multi-word symbol already separated by dashes, you append the suffix as "-p" (dash-p); while if it is a single word or mnemonic symbol name, the "p" can be appended without a dash.

```lisp
(bit-vector-p #*01010001)
=> T
(integerp 10)
=> T
```

## Parentheses, Indentation, and Whitespace

Parentheses should all close on the same line, when ending multiple forms; while balancing parentheses on separate lines from your code, to demarcate a code block, is common practice in other languages, it is not the case in Common Lisp.  If you are having trouble matching the parentheses in your head, use a source-code editor which highlights matching opening or closing parens.  And since in Lisp, all non-atomic forms are lists, and wrapped in a pair of parentheses, it is also worthwhile to use tools to find unmatched parens.

```lisp
;; bad style
(defun a-badly-formatted-function (x y z)
  (progn
    (setq x (+ x x))
    (setq y (* y y))
    (mod
      (+ z z)
      (+ x y)
      )
    )
  )

;; the right way
(defun a-pretty-function (x y z)
  "Function definitions need docstrings."
  (declare (integer x y z))
  (let ((x2 (+ x x))
        (y2 (* y y)))
    (mod (* z z) (+ x2 y2))))
```

If you have trouble getting Lisp style right, you can always run your code through the Pretty Printer to see how Lisp thinks it should be formatted.

If you use Emacs+SLIME (and many Lisp Hackers will tell you that you must), proper indentation is handled quite well; other editors, such as Sublime Text, need a plugin installed to indent Lisp code correctly.  Generally, it is better to use the space character for your indentation, over the Tab; each nested form that lives on its own line should be indented by 2 spaces from its parent form; forms broken into lines for clarity can be lined up in a column, such as property lists and parameters.

You only need a single space between forms in a list.  Likewise, you only need one extra line between top-level forms.  Extraneous whitespace makes your code more difficult for others to read.  Also avoid the temptation to use the Tab character inside a form to line up code blocks into a table-like structure.  This isn't FORTRAN, it's Lisp---and Lisp should *flow*.

```lisp
;; a badly formatted class definition
(defclass march-hare ()
  ((name        :type string  :initarg :name        :initform "Haigha"  :accessor name)
   (tea-time-p  :type boolean :initarg :tea-time-p  :initform t         :accessor tea-time-p)
   (tie         :type string  :initarg :tie         :initform "bow-tie" :accessor tie)))

;; the right way
(defclass march-hare ()
  ((name :type string :initarg :name :initform "Haigha" :accessor name
         :documentation "The name of the March Hare.")
   (tea-time-p :type boolean :initarg :tea-time-p :initform t :accessor tea-time-p
               :documentation "Whether or not it's tea-time.")
   (tie :type string :initarg :tie :initform "bow-tie" :accessor tie
        :documentation "The style of tie the March Hare is wearing."))
  (:documentation "'The March Hare will be much the most interesting, and perhaps as this is May it won't be raving mad---at least not so mad as it was in March.' -- Lewis Carroll"))
```

## Comments and Documentation

You should always comment and document your code; that being said, Lisp, when written correctly, can be effectively self-documenting and self-explanatory (see "Decomposition, Refactoring, and Abstraction" below for more information).  Your code should be clean and readable enough that comments and documentation are technically unnecessary, but then write clean, short, and to-the-point comments and documentation strings to expand on what the code itself already says.

Conventions for comments in Lisp are pretty loose, but if you read enough Lisp source-code, you'll find the following general pattern:

```lisp
;;;; four preceding semi-colons for file headers, copyright and license information

;;; three preceding semi-colons for descriptive text

;; two preceding semi-colons for commentary on the immediately following text

; one preceding semi-colon for in-line comments, inside code blocks
```

You should always include meaningful docstrings in your object definition forms---even in your global variables.  In class definition forms, you can add docstrings to each slot of the class, the class itself, and each of the generic functions and methods.  Lack of documentation, or documentation that has fallen out of sync with the codebase, is considered a bug just as much as code that does not work as expected.

## Decomposition, Refactoring, and Abstraction

Your Lisp code should be so clear and focused that, whenever possible, even a non-programmer can read and understand it.  This is more difficult than you might expect, as it requires careful thought and planning to achieve successfully.

The general idea is to divide your code up into the smallest reusable pieces; if, for example, you were to write a new summation function, and it contained logic for sorting a list of numbers, instead of writing the logic for sorting a list in-line, inside the summation function, you could write a separate list-sorting function, and call it inside the summation function.  This offers three immediate benefits: you get a new, generally useful function almost for free; the logic of your summation function is more tightly focused on the task it was designed for; and the code becomes easier to read and maintain.  You can then improve the implementation of either function without worrying about the other.

Oftentimes, as you work on software, you'll find repetitive code-patterns that become cumbersome to write, and may all need to be changed separately during maintenance, refactoring, or major upgrades.  Common Lisp, through the most-favoured Emacs+SLIME development environment, is highly interactive, so it supports incremental, functional development.  Whenever you come across redundant patterns, it is in your interest to abstract away those code patterns into a macro, which at compile-time will be transformed into the code you need at run-time.  This technique also allows you to do some pretty awesome stuff, like intelligently creating interfaces derived from a dynamic data-set; but you should get into the habit of this style of programming, because it will make your code cleaner and easier to manage over time.

## Functions, Macros, and Methods

Sometimes it can be difficult to decide when, in your software, to use a function, macro, or method and CLOS class for a specific problem.  Again, since Lisp offers so many options for choice of paradigm, you can program in any number of styles, and even mix-and-match paradigms in the same source-code file without trouble; but this rampant mix-and-matching can create unnecessary frustration for maintenance, debugging, and upgrading; so it's useful to pick a dominant paradigm and stick to it.

That being said, if you want to take full advantage of Common Lisp's multi-paradigm toolset, you can do so sanely.  It is simply a matter of deciding up-front how you're going to organize your code and express your logic.

A multi-paradigm approach to programming that I have found useful is straightforward, logically consistent, and in keeping with the design goals of the Common Lisp language:

* Separate application tasks into computation, transformation, and statefulness.
* Decompose all application logic into pure, clearly-defined functions.
* Use macros for monadic-style I/O in pure functional programs; object-oriented programs are designed with I/O in mind.
* When writing functions, program functionally.  Avoid writing functions that cause side-effects or are destructive, in-place operations; but if you have to, name them appropriately so that it is obvious.
* Use macros when abstracting.  The point of macros is compile-time code-transformation.  Your macros will be more generally useful when you decompose logic from them into pure functions, and use them for their intended purpose.
* When you need to track state, and thus cause side-effects, you should use CLOS classes and methods&mdash;they were designed with that purpose in mind.

## Cross-Platform Development

Lisp is, by nature, a cross-platform development language; but each implementation of Common Lisp contains implementation-dependent extensions, and platform-specific functionality that is unavoidable.  Generally speaking, you should make every effort to write cross-platform, cross-implementation software, so that it "just works" everywhere.  When a problem requires implementation or platform specific code to solve, take the extra five minutes to find out how to make it work on other platforms.  If you need to, refer to the source code of other popular cross-platform libraries, to see how they approach the problem.

As an example, you can and should write software that takes advantage of 64-bit architectures; but even today, you cannot always count on it being there for your users.  Your software should scale gracefully to 32-bit architectures.  And when certain features require it, document them as such and provide an alternative.

The same is true for web applications.  You can't predict which browser your users will prefer; and users resent getting a page that tells them to upgrade or change their browser.  You have no choice but to support every browser and platform&mdash;so, think about Lisp software the same way, and you will be doing yourself and your users a favor from the beginning.

Be certain to test your code on every platform you have access to, and in multiple implementations of Lisp for each platform. It may seem like a lot of extra work for nothing at first, but it will save you a lot of time down the road.

## Libraries

As well as learning the Common Lisp language, it is important to familiarize yourself and keep up to date with the wide variety of Lisp libraries available on-line, particularly those in the Quicklisp package repository.  There are two important reasons for this:

* Instead of reinventing the wheel, you can use a feature-complete, dedicated library to implement your functionality.
* When you know what libraries are freely available, you can dedicate more of your time to writing and testing new code.

Also, whenever it is both possible and reasonable, the code you write should be packaged into logical units, and distributed as open-source libraries that are loadable through Quicklisp.  Depending on the type of company you work for, however, this may be more difficult than you might expect; most software development shops like to control all IP produced by their employees, even code produced in their off-hours&mdash;if you have a contract, be sure to check with your manager first before you release any software you write into the wild; and in the future, keep an eye out for such clauses and be certain to fight for your right to contribute to open-source software.

Knowing what code to push up from a software project into a general purpose library can be tricky, but there are a few rules you can keep in mind:

* If you find yourself copy and pasting code between projects.
* If you abstract a common problem into a cleaner syntax.
* If your code solves a known problem or lack in the Lisp community, that is too general for a specific commercial software project.

<ul class="pager">
  <li class="previous"><a href="/book/1-01-02-more-detail/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-01-04-configuration/">Next &raquo;</a><li>
</ul>
