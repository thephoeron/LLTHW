<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-00-00-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Cryptography and Security</li>
</ol>

## Chapter 3.11

# Cryptography and Security

> "An armed society is a polite society."
> <footer>Robert A. Heinlein, <em>Beyond This Horizon</em></footer>

**Revision Note:** *Update chapter intro text to support more in-depth cryptography discussion.*

The tools available in the ANSI Common Lisp standard for handling binary data and advanced mathematics, among other more-or-less hidden features of Common Lisp compilers, make it an ideal environment for implementing robust cryptographic utilities and secure software.  Naturally, cryptography is a highly specialized subject, and requires deep exploration to grok fully. No general purpose programming language is a magic bullet that allows a layperson to write cryptographic software without extensive training; but *if* you are interested in cryptographic security as a specialization, this chapter will---hopefully---at least point you in the right direction.

In this chapter we will review again the mathematics of cryptography, alongside the theory that makes it work and the code we have already written; we will take a deeper exploration of random and pseudo-random number generation; write a one-time pad cipher using CL-ISAAC, suitable for gaming; explore the use-cases of all the tools available to a developer using the Ironclad library; and try our hand at extending Ironclad to support more advanced cryptographic protocols.

For a list of further readings on cryptography, please consult the Resources section of this site.

## Exercise 3.11.1

**The Math of Modern Cryptography**

```lisp

```

## Exercise 3.11.2

**Post-Quantum Cryptography**

```lisp

```

## Exercise 3.11.3

**Cryptographically Strong (Pseudo)-Random Number Generators**

```lisp

```

## Exercise 3.11.4

**A One-Time Pad using CL-ISAAC**

```lisp

```

## Exercise 3.11.5

**Ironclad: Authentication**

```lisp

```

## Exercise 3.11.6

**Ironclad: Hashing**

```lisp

```

## Exercise 3.11.7

**Ironclad: Encryption**

```lisp

```

## Exercise 3.11.8

**Secure Coding Principles**

```lisp

```

## Project 3.11.9

**Extending Ironclad: Elliptical Curve Cryptography**

```lisp

```

<ul class="pager">
  <li class="previous"><a href="/book/3-10-00-data.md">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-12-00-fintech.md">Next &raquo;</a><li>
</ul>
