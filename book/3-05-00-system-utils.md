<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-00-00-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Drivers, Daemons, and System-Utilities</li>
</ol>

## Chapter 3.5

# Drivers, Daemons, and System-Utilities

> "Anyone who considers protocol unimportant has never dealt with a cat."
> <footer>Robert A. Heinlein, <em>The Cat Who Walks Through Walls</em></footer>

Not every application you write actually needs a GUI.  There's a wide class of drivers, daemons, and system-utilities which make more sense to distribute as command-line utilities.  Generally, when designing an application, you ask yourself who or what the user is; if the intended user is a sysadmin, or another application, a daemon is a really useful type of system-utility that runs in the background and provides low-level interfaces to system-critical functionality.  Conversely, if your application only needs to do one thing at a time and exit, then a simple command-line utility will do.  Drivers are a bit different, as the intention behind them is to provide an API to hardware that the computer otherwise does not know how to use; they often don't need to run as their own process, and can be embedded in the applications that need them, or linked to through Lisp's FFI.

Drivers, much like any other library, are aptly suited for distribution through Quicklisp, whereas your full applications (daemons, command-line utilities, gui, mobile, and web apps) are best distributed through traditional means.  Naturally, to write a driver you need to be intimately familiar with the low-level protocol for the hardware device---this means working directly with binary streams, byte-vectors, and sockets, to recreate the protocol specification for the device in question, and provide your users with a high-level API to the device that can be used in their Lisp applications.

There are a number of libraries already available in Quicklisp to make the writing of drivers, daemons, and system-utilities much simpler; many of which have already been touched upon in previous chapters.  In the following exercises we will be taking a deeper look at CLON (the Command-Line Options Nuker), SB-DAEMON, Nibbles; how to implement low-level protocols using sockets and streams; and the design of useful command-line interfaces and APIs.

## Exercise 3.5.1

**Nibbles**

## Exercise 3.5.2

**SB-DAEMON**

## Exercise 3.5.3

**CLON, Revisited**

## Exercise 3.5.4

**Useful Command-Line Interfaces**

## Exercise 3.5.5

**Low-Level Protocols**

## Project 3.5.6

**A Hardware Driver**

## Project 3.5.7

**A Daemonized Service**

## Project 3.5.8

**A Suite of Command-Line Utilities**

<ul class="pager">
  <li class="previous"><a href="/book/3-04-00-gui/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-06-00-reverse-engineering/">Next &raquo;</a><li>
</ul>
