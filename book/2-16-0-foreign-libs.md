<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Extra Credit: Foreign Libraries in Lisp</li>
</ol>

## Chapter 2.16 --- Extra Credit

# Foreign Libraries in Lisp

> "I was indeed a total stranger in an utterly strange and confusing land... but I do not think, in retrospect, that I would have made my condition worse had I simply blurted out my predicament. I would not have been believed."
> <footer>Robert A. Heinlein, <em>Job: A Comedy of Justice</em></footer>

Like many other languages these days, Lisp allows you to call-out to libraries written in other languages, as if they were native Lisp code. But Lisp was one of the first languages to include this feature, and the term "Foreign Function Interface" was actually introduced specifically for this functionality in Common Lisp.

We've already seen some foreign libraries in action---such as `lispbuilder-sdl` in Chapter 2.12, and a few database libraries in Chapter 2.4. In this chapter we will be exploring a variety of foreign function interface libraries available in Quicklisp, so that you can get a feel for working with Lisp in a diverse ecosystem of code from many different sources---even Python libraries!

* CL-COLLIDER, an interface to the SuperCollider algorithmic programming environment
* CL+SSL, an interface to the OpenSSL library
* GSLL, an interface to the GNU Scientific Library
* Burgled-Batteries, a Lisp bridge to Python

<ul class="pager">
  <li class="previous"><a href="/book/2-15-0-docs-and-inspection/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-17-0-debugging-testing/">Next &raquo;</a><li>
</ul>
