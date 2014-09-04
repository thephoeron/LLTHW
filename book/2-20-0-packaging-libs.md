<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Extra Credit: Packaging Lisp Libraries</li>
</ol>

## Chapter 2.20 --- Extra Credit

# Packaging Lisp Libraries

> "Relevant quote..."
> <footer>Source</footer>

Now that you've got a solid grounding in writing, optimizing, debugging and testing your Lisp software, it's time to learn all about packaging your code for the wild---namely with ASDF, to be distributed in the Quicklisp package manager.  You've been using ASDF system files and Quicklisp to manage your projects since Part One, but now it's time to take a closer look at the structure of these ASDF files, and all the awesome power they can hold.

But, as the famous saying goes, with great power comes great responsibility---there's a right way of packaging your libraries, and there are certain limitations as to what sort of project qualifies for inclusion in Quicklisp.  We'll be covering all this and more.

This chapter will include exercises on:

* ASDF Files and `defsystem`
* Naming rules of ASDF system files
* Required System Metadata for Quicklisp
* Dependencies
* Component files and modules
* Splitting up your library into multiple systems
* Separate systems for codebase and test-suites

<ul class="pager">
  <li class="previous"><a href="/book/2-19-0-essential-libs/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-21-0-review/">Next &raquo;</a><li>
</ul>
