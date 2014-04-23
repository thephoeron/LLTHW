# LLTHW

### Common Lisp Style Guide

Style is fundamental to programming&mdash;particularly in Lisp, where the unlimited power and flexibility of paradigm can easily go to your head.  A little carelessness can make for sloppy, illegible code; but if you make a point to consider your code as an artform as well as a tool to get a job done, you, and anyone else who has to read your code later, will thank you for it.

But don't make the mistake of thinking these rules are prescriptive; and not everyone in the Lisp community agrees with them.  Consider them more like practical suggestions which will get you thinking about style, and then you and your team can decide together which style rules you want to follow for your coding aesthetic.

At this stage of learning Lisp, you may not fully appreciate all the style rules given here, or understand everything being discussed.  And that's okay.  Take a deep breath, and familiarize yourself with these points to the best of your ability, and then treat this chapter like a reference; it will mean more and more after each chapter of this book you work through, and will be something you can keep referring to with each Lisp project.

#### Symbols and Naming

Clear and meaningful symbol-names in your Lisp programs are one of the most important aspects of code readability.

While there are no hard-fast rules for naming stmbols in the Common Lisp standard, beyond a list of which characters are allowed, certain conventions have arisen in the Lisp community which you should know, and usually follow religiously.  There are times when you can, and may have to, break convention, but those are special cases which require experience and finesse.

Symbol names should be descriptive, short, typed in all lowercase, with words separated by a single hypen:

```lisp
;; Example symbol names
'my-addition-function
'my-integer-type
'my-hash-table
'my-list-of-alists
```

Global variables, *i.e.*, variables declared as top-level forms with `defvar` or `defparameter`, are named using "earmuffs":

```lisp
'*my-global-variable*
```

#### Parentheses, Indentation, and Whitespace

Parentheses should all close on the same line, when ending multiple forms; while balancing parentheses on separate lines from your code, to demarcate a code block, is common practice in other languages, it is not the case in Common Lisp.  If you are having trouble matching the parentheses in your head, use a source-code editor which highlights matching opening or closing parens.  And since in Lisp, all non-atomic forms are lists, and wrapped in a pair of parentheses, it is also worthwhile to use tools to find unmatched parens.

If you use Emacs (which many Lispers will tell you that you must use), proper indentation is handled quite well; other editors, such as Sublime Text, need a plugin installed to indent Lisp code correctly.  Generally, it is better to use the space character for your indentation, over the Tab; each nested form that lives on its own line should be indented 2 spaces; forms broken into lines for clarity should be lined up in a column.

You only need a single space between forms in a list.  Likewise, you only need one extra line between top-level forms.

#### Comments and Documentation

You should always comment and document your code; that being said, Lisp, when written correctly, can be effectively self-documenting and self-explanatory (see "Decomposition, Refactoring, and Abstraction" below for more information).  Your code should be clean and readable enough that comments and documentation are technically unnecessary, but then write clean, short, and to-the-point comments and documentation strings to expand on what the code itself already says.

Conventions for comments in Lisp are pretty loose, but if you read enough Lisp source-code, you'll find the following general pattern:

```lisp
;;;; four preceding semi-colons for file headers, copyright and license information

;;; three preceding semi-colons for descriptive text

;; two preceding semi-colons for commentary on the immediately following text

; one preceding semi-colon for in-line comments, inside code blocks
```

#### Decomposition, Refactoring, and Abstraction

Your Lisp code should be so clear and focused that, whenever possible, even a non-programmer can read and understand it.  This is more difficult than you might expect, as it requires careful thought and planning to achieve successfully.

The general idea is to divide your code up into the smallest reusable pieces; if, for example, you were to write a new summation function, and it contained logic for sorting a list of numbers, instead of writing the logic for sorting a list in-line, inside the summation function, you could write a separate list-sorting function, and call it inside the summation function.  This offers three immediate benefits: you get a new, generally useful function almost for free; the logic of your summation function is more tightly focused on the task it was designed for; and the code becomes easier to read and maintain.  You can then improve the implementation of either function without worrying about the other.

Oftentimes, as you work on software, you'll find repetitive code-patterns that become cumbersome to write, and may all need to be changed separately during maintenance, refactoring, or major upgrades.  Common Lisp, through the most-favoured Emacs+SLIME development environment, is highly interactive, so it supports incremental, functional development.  Whenever you come across redundant patterns, it is in your interest to abstract away those code patterns into a macro, which at compile-time will be transformed into the code you need at run-time.  This technique also allows you to do some pretty awesome stuff, like intelligently creating interfaces derived from a dynamic data-set; but you should get into the habit of this style of programming, because it will make your code cleaner and easier to manage over time.

#### Functions, Macros, and Methods

Sometimes it can be difficult to decide when, in your software, to use a function, macro, or method and CLOS class for a specific problem.  Again, since Lisp offers so many options for choice of paradigm, you can program in any number of styles, and even mix-and-match paradigms in the same source-code file without trouble; but this rampant mix-and-matching can create unnecessary frustration for maintenance, debugging, and upgrading; so it's useful to pick a dominant paradigm and stick to it.

That being said, if you want to take full advantage of Common Lisp's multi-paradigm toolset, you can do so sanely.  It is simply a matter of deciding up-front how you're going to organize your code and express your logic.

A multi-paradigm approach to programming that I have found useful is straightforward, logically consistent, and in keeping with the design goals of the Common Lisp language:

* Separate application tasks into computation, transformation, and statefulness.
* Decompose all application logic into pure, clearly-defined functions.
* Use macros for monadic-style I/O in pure functional programs; object-oriented programs are designed with I/O in mind.
* When writing functions, program functionally.  Avoid writing functions that cause side-effects or are destructive, in-place operations; but if you have to, name them appropriately so that it is obvious.
* Use macros when abstracting.  The point of macros is compile-time code-transformation.  Your macros will be more generally useful when you decompose logic from them into pure functions, and use them for their intended purpose.
* When you need to track state, and thus cause side-effects, you should use CLOS classes and methods&mdash;they were designed with that purpose in mind.

#### Cross-Platform Development

#### Libraries
