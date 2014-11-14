<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-0-0-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">A Simple LispOS</li>
</ol>

## Chapter 3.20

# A Simple LispOS

> "The difference between science and the fuzzy subjects is that science requires reasoning, while those other subjects merely require scholarship."
> <footer>Robert A. Heinlein, <em>Time Enough for Love</em></footer>

**Note:** *the exercises in this chapter may require an additional computer to complete, and due to the prohibitive cost and lack of availability for some readers, it should be considered optional*.

The elegance, power, and expressiveness of Lisp often encourages students of the language to wish for a more complete, live hackable, Lisp-based environment that extends beyond the Emacs+SLIME development environment; they usually start with either a Lisp-based window manager, such as StumpWM, or replacing their command-line shell with the Lisp REPL, and then quickly come to the conclusion, "why can't the whole operating system be written in Lisp?"  Well, it's not quite so easy as that... but it is still very much in the realm of possibility.

If you already run a Linux-based Operating System, you can start by just replacing pieces of your distro one-by-one with Lisp-based equivalents; but it is probably much safer if you use a spare computer, or a virtual machine, so that if anything goes wrong you won't lose any personal data.

In this chapter, we will review the basic organization of operating systems, and what software they typically need to contain; take a brief tour of the available open-source Common Lisp software for building an Operating System; and build a custom version of Linux that uses a Common Lisp composite display manager, window manager, and the SBCL REPL as your login shell.

<ul class="pager">
  <li class="previous"><a href="/book/3-19-0-neurotech/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-21-0-lisp-machine/">Next &raquo;</a><li>
</ul>
