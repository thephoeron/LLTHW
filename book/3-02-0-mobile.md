<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-0-0-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Native Mobile Applications</li>
</ol>

## Chapter 3.2

# Native Mobile Applications

> "Progress doesn't come from early risers---progress is made by lazy men looking for easier ways to do things."
> <footer>Robert A. Heinlein, <em>Time Enough For Love</em></footer>

Mobile devices are ubiquitous---there are nearly 7 Billion mobile devices in use around the world [according to the ITU](http://www.itu.int/en/ITU-D/Statistics/Documents/facts/ICTFactsFigures2014-e.pdf), which is almost as many people as there are on the planet; thus, the importance of developing native applications to target mobile devices cannot be overstated.

But each mobile platform is bogged down by its own proprietary environment, toolchain, etc.  Maintaining separate codebases is expensive and time-consuming.  If only there was some way to target all platforms natively, with one code-base.  Oh wait, this is a book on Lisp, so *of course* there is.

The most popular library for native mobile development in Common Lisp is [MOCL](https://wukix.com/mocl)---it currently supports Android, iOS, and OS X native apps, and support for the Apple Watch is also expected soon. [LispWorks](http://www.lispworks.com/news/news31.html) has also begun to offer support for Android, and has a demo app available [on Google Play](https://play.google.com/store/apps/developer?id=LispWorks+Ltd&hl=en).  But there are also open-source alternatives: SBCL runs natively on Android and ARM processors, Clozure CL can target iOS, ECL compiles to C code which can run on either iOS or on Android with the NDK, and there is the new implementation of Common Lisp, Clasp, which targets LLVM to interoperate with C++.  In other words, you have choices.

That being said, mobile development is primarily a commercial endeavour, so in this chapter we will emphasize the commercial solutions to native mobile Common Lisp development, with MOCL and LispWorks.

TO-DO: Profile CLASP, ECL, SBCL, and CCL native app development.

<ul class="pager">
  <li class="previous"><a href="/book/3-01-0-web-apps/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-03-0-gui/">Next &raquo;</a><li>
</ul>
