<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-0-0-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Reverse Engineering</li>
</ol>

## Chapter 3.5

# Reverse Engineering

> "Aside from a cold appreciation of my own genius I felt that I was a modest man."
> <footer>Robert A. Heinlein, <em>Double Star</em></footer>

**Disclaimer:** *Reverse engineering commercially licensed software may subject you to criminal prosecution. The material in this chapter is presented for informational purposes only, to aid in the authorized porting of software to the Common Lisp language, and the recovery of lost source code by the owners of the software; its use for criminal activities, including but not limited to, intellectual property theft, and circumvention of software authorization and digital-rights management protocols, in violation of the license agreements of commercial software and other digital assets is strictly prohibited.*

Reverse Engineering is an art, more than a science---that being said, it is also a highly skilled area that requires a deep understanding of all aspects of computer science.  While this chapter will cover the essential techniques to reverse engineer software using the Common Lisp language, it does not attempt to teach the methodology or theory behind reverse engineering.  For a complete, general introduction to the subject, please see the Resources section for texts related to this area.

In this chapter we will explore the structure of binary applications as output by various compilers, the features available across the most popular reverse engineering tools, and what Lisp offers that other tools don't.  We will then tackle the specific reverse engineering tasks to progressively migrate a closed-source application to Lisp by parsing `objdump` files, generating header files (for software compiled from C/C++), parsing common patterns in Assembly Language to create low-level Lisp code, and then wrapping up everything together to generate high-level Lisp code that can be used to maintain and compile a new version of the reverse engineered software.

<ul class="pager">
  <li class="previous"><a href="/book/3-04-0-system-utils/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-06-0-graphics/">Next &raquo;</a><li>
</ul>
