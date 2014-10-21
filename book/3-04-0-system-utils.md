<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-0-0-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Drivers, Daemons, and System-Utilities</li>
</ol>

## Chapter 3.4

# Drivers, Daemons, and System-Utilities

> "Anyone who considers protocol unimportant has never dealt with a cat."
> <footer>Robert A. Heinlein, <em>The Cat Who Walks Through Walls</em></footer>

Not every application you write actually needs a GUI.  There's a wide class of drivers, daemons, and system-utilities which make more sense to distribute as command-line utilities.  Generally, when designing an application, you ask yourself who or what the user is; if the intended user is a sysadmin, or another application, a daemon is a really useful type of system-utility that runs in the background and provides low-level interfaces to system-critical functionality.

---

CLON (the Command-Line Options Nuker), SB-DAEMON, low-level and system libraries.

Discuss implementing low-level protocols, building on earlier material on sockets and binary streams.

Designing useful command-line interfaces.

<ul class="pager">
  <li class="previous"><a href="/book/3-03-0-gui/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-05-0-reverse-engineering/">Next &raquo;</a><li>
</ul>
