<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-0-0-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Cryptography and Security</li>
</ol>

## Chapter 3.10

# Cryptography and Security

> "An armed society is a polite society."
> <footer>Robert A. Heinlein, <em>Beyond This Horizon</em></footer>

The tools available in the ANSI Common Lisp standard for handling binary data and advanced mathematics, among other more-or-less hidden features of Common Lisp compilers, make it an ideal environment for implementing robust cryptographic utilities and secure software.  Naturally, cryptography is a highly specialized subject, and requires deep exploration to grok fully. No general purpose programming language is a magic bullet that allows a layperson to write cryptographic software without extensive training; but *if* you are interested in cryptographic security as a specialization, this chapter will---hopefully---at least point you in the right direction.

In this chapter we will review again the mathematics of cryptography, alongside the theory that makes it work and the code we have already written; we will take a deeper exploration of random and pseudo-random number generation; write a one-time pad cipher using CL-ISAAC, suitable for gaming; explore the use-cases of all the tools available to a developer using the Ironclad library; and try our hand at extending Ironclad to support more advanced cryptographic protocols.

For a list of further readings on cryptography, please consult the Resources section of this site.

<ul class="pager">
  <li class="previous"><a href="/book/3-09-0-data/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-11-0-fintech/">Next &raquo;</a><li>
</ul>
