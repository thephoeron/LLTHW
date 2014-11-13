<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-0-0-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">A Simple LispOS</li>
</ol>

## Chapter 3.20

# A Simple LispOS

> "Relevant quote..."
> <footer>Source</footer>

**Note:** *the exercises in this chapter may require an additional computer to complete, and due to the prohibitive cost and lack of availability for some readers, it should be considered optional*.

The elegance, power, and expressiveness of Lisp often encourages students of the language to wish for a more complete, live hackable, Lisp-based environment that extends beyond the Emacs+SLIME development environment; they usually start with either a Lisp-based window manager, such as StumpWM, or replacing their command-line shell with the Lisp REPL, and then quickly come to the conclusion, "why can't the whole operating system be written in Lisp?"  Well, it's not quite so easy as that... but it is still very much in the realm of possibility.



---

**Note:** *deprecated chapter text---leave all Lisp Machine references for next chapter*.

At some point in every Lisp Hacker's journey to mastery of the language, they learn about the old Lisp Machines, the powerful single-user workstations that existed in the golden-age of Lisp before the AI Winter.  These Lisp Machines were not just unique for the technological innovations they introduced, and for running the Lisp language pretty much on the bare metal; they also utilized a pure Lisp operating system, that extended the power, elegance, and programmability of the Lisp language to the entire computing experience.

Many Lisp Hackers have, at one point or another, attempted to resurrect the LispOS dream---but so far, the most progress has been made by Robert Strandh, the creator and lead developer of SICL.  The main purpose of this chapter will be to get you up to speed on the LispOS project, and get the skills necessary to contribute.  Toward this end, we will review the structure and purpose of Operating Systems, and build a basic LispOS on top of the Linux kernel.

---

Will need a spare PC/Linux box that can be scrapped if you screw up.

Show how to strip out key Linux components, replacing them with Lisp, packages for replacing the shell, installing and using StumpWM, etc.

<ul class="pager">
  <li class="previous"><a href="/book/3-19-0-neurotech/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-21-0-lisp-machine/">Next &raquo;</a><li>
</ul>
