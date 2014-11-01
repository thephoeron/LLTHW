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

The tools available in the ANSI Common Lisp standard for handling binary data and advanced mathematics, among other more-or-less hidden features of Common Lisp compilers, make it an ideal environment for implementing robust cryptographic utilities and secure software.

The most popular open-source library for cryptography in Common Lisp is Ironclad, which we've seen before in a few trivial examples; but cryptography is a highly specialized subject, and requires deeper exploration to grok fully.

In this chapter we will review again the mathematics of cryptography, alongside the theory that makes it work and the code we have already written; we will take a deeper exploration of random and pseudo-random number generation; explore the use-cases of all the tools available to a security developer in Ironclad; and try our hand at extending Ironclad to support more advanced cryptographic protocols.

---

Overview of CL+SSL, Ironclad, CL-ISAAC, and similar libraries.

Parse OpenSSL keys and certificates. (?)

Write a one-time pad cipher using CL-ISAAC (?)

Extend Ironclad's AES encryption with OCB mode (patented in the united states, licensed free for open source projects). (?)

Extend IOLib to include support for SSL and Secure Websockets (?)

<ul class="pager">
  <li class="previous"><a href="/book/3-09-0-data/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-11-0-fintech/">Next &raquo;</a><li>
</ul>
