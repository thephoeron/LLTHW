<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Extra Credit: Command-Line Utilities</li>
</ol>

## Chapter 1.15 --- Extra Credit

# Command-Line Utilities

> "The trouble with lessons from history is that we usually read them best after falling flat on our chins."
> <footer>Robert A. Heinlein, <em>Starship Troopers</em></footer>

Underlying every modern operating system is some sort of command-line.  You may never have seen it before you began your journey with Lisp, but it's always been there---the real interface to your computer, on top of which all others are built.  Compared to what you can do from the command-line, graphical user interfaces (no matter how sleek and intuitive), are clunky and slow, and hold you back.

As a programmer, all you need is this command-line---and it's worth your time to make it your best friend.  You may have even noticed how power-users seem to go out of their way to strip out the GUI from their workspace, retrofitting their OS into a souped-up 80s-style text-only terminal.  This is no mere affectation---it's all about productivity.

So now we're going to begin our journey of creating distributable Lisp binaries by creating a useful utility application that you can run from the command-line yourself, without having to open up Lisp first.  It will run like any other program on your computer---and, if you have access to Windows, OS X, and Linux, you can create binary distributions of your software and provide them to your users instead of a source code release.

Command-Line Interfaces may not seem like a big deal to you, at first glance.  You enter a few words in the terminal, and you get your output.  Where's the challenge in that, right?

I suppose it is a matter of opinion, but in my experience, crafting a useful, productive command-line interface to an application is a much greater challenge than designing a point-and-click or touch-based GUI.  After all, when the only thing your users have to guide them is what's output by the `--help` flag, the terminal can be a scary, lonely place if you didn't put enough thought into the arguments and documentation for your application.

This chapter will contain exercises on:

* Manually parsing arguments from the command-line
* Introducing CLON: The Command-Line Options Nuker
* Loading Quicklisp in Lisp Scripts, but mention that it is considered 'bad practice'
* Defining Your Application's Synopsis
* Defining Your Application's Event Loop
* Dumping Binaries
* Distributing your Text-Adventure as a Binary
* Deploying your Web App as a Daemon

## Exercise 1.15.1

**Manually parsing arguments from the command-line**

## Exercise 1.15.2

**Introducing CLON: The Command-Line Options Nuker**

## Exercise 1.15.3

**CLON: Synopsis**

## Exercise 1.15.4

**CLON: Event Loop**

## Exercise 1.15.5

**Introducing Buildapp**

## Exercise 1.15.6

**Rewrite Your Text-Adventure to Use CLON and Buildapp**

## Exercise 1.15.7

**Rewrite Your Web App as a Daemon**

<ul class="pager">
  <li class="previous"><a href="/book/1-14-0-conditionals.md">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-16-0-map-loop.md">Next &raquo;</a><li>
</ul>
