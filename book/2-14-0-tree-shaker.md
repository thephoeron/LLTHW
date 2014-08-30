<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Extra Credit: Write a Tree-Shaker</li>
</ol>

## Chapter 2.14 --- Extra Credit

# Write a Tree-Shaker

> "Whatever the answers are, here's one monkey that's going to keep on climbing, and looking around him to see what he can see, as long as the tree holds out."
> <footer>Robert A. Heinlein, <em>Methuselah's Children</em></footer>

You've probably noticed in previous exercises, that when creating executable binaries of your Lisp programs to distribute or share, their size on your file system has been somewhat larger than you expected---over 80 MBs even for just a simple command-line application.  If you were to deploy this same Lisp application with a commercial implementation of ANSI Common Lisp, however, you would get a much smaller application: for a simple command-line application, probably less than 1 MB.  What gives, right?  That's a pretty big discrepancy!

As it turns out, whenever you dump a Common Lisp environment to an executable binary, you're dumping *everything*.  The entire Lisp language, every contrib package, the REPL, the debugger, all the packages you've loaded in as dependencies, and your application itself.  The commercial Lisps do this too---only they don't stop there, like the open-source implementations of Common Lisp---they then "shake the tree" of your Lisp application to prune all the unused symbols from the final executable.  Your final executable binary then only contains a subset of Lisp needed to execute your program, and strips out everything else not needed for run-time.

There are pros and cons to both approaches.  Many Lisp Hackers consider shipping the full Common Lisp environment with each instance of the application to be a feature---after all, you can embed a SWANK server into every app, and work with the live instance on the target platform, debugging and testing as it continues working.  You can also provide a Lisp REPL to your users and let them customize everything in your program to their liking.

Commercial Lisps take a more traditional approach, and provide a clear separation between developers and users.  So their binaries are stripped of everything that a user, in their view, should not have access to.

Whether or not you care about providing your users the full power of Common Lisp as a part of the application run-time, writing a tree-shaker is an interesting exercise, and may give you a deeper understanding of Lisp's implementation and execution on the machine level.  To-date, the best example of a tree-shaker for SBCL was written several years ago by [Juho Snellman](http://jsnell.iki.fi/blog/archive/2005-07-06.html), but as SBCL has gone under considerable development since that time, it requires a fresh perspective---which is a perfect opportunity for learning!

This chapter will contain exercises on:

* Concepts of Tree-Shaking
* A Basic Tree-Shaker for SBCL
* Improving and Extending the Tree-Shaker
* Packaging the tree-shaker as a library
* Extending the 2D-Game engine to use the tree-shaker library

<ul class="pager">
  <li class="previous"><a href="/book/2-13-0-compiler/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-15-0-docs-and-inspection/">Next &raquo;</a><li>
</ul>
