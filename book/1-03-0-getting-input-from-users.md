<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Extra Credit: Getting Input From Users</li>
</ol>

## Extra Credit

# Getting Input From Users

> "Never worry about theory as long as the machinery does what it's supposed to do."
> <footer>Robert A. Heinlein, <em>Waldo &amp; Magic, Inc.</em></footer>

Often, as a programmer you'll need to handle unpredictable user input. You have no way of knowing what a user might try to enter when you give them a prompt or a form, whether because of unfamiliarity with the system, ignorance of some arbitrary convention, or in the worst case, malicious intent.  Not all programs *need* a way to handle data entry or text commands---but when your program does, it's important to consider in advance how you will validate all user input before it is parsed, read, evaluated, or stored by Lisp.

Lisp has some particularly powerful tools for handling all these possibilities.  You can even give your users a complete Lisp REPL that allow them to live-hack your application for customizability---but it could also allow them to easily break everything.  Given a few best practices, however, you can implement a validated, sandboxed shell; prevent SQL injection attacks; and more.

We won't be going over every aspect of this task here, but this Extra Credit chapter should be enough to get you thinking about validating every possible interaction a user might have with your program, to keep it secure and stable.

This Chapter will contain exercises on:

* READ
* EVAL
* Sequences
* Concatenation
* Splitting
* Replacing
* Parsing Numbers
* Custom Prompts

<ul class="pager">
  <li class="previous"><a href="/book/1-02-00-input-output/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-04-0-lists/">Next &raquo;</a><li>
</ul>
