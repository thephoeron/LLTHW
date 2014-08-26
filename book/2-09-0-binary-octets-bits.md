<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/2-0-0-overview/">Part Two: The Suffusion of Blue</a></li>
  <li class="active">Binary Streams, Octet-Vectors, and Bit-Vectors</li>
</ol>

## Chapter 2.9

# Binary Streams, Octet-Vectors, and Bit-Vectors

> "I counted to ten slowly, using binary notation."
> <footer>Robert A. Heinlein, <em>The Door Into Summer</em></footer>

Everything that happens inside a computer, happens as binary-encoded instruction sequences---and everything that is stored in memory or on your filesystem, is also stored in binary.  When people think of "machine language", they often think in terms of assembly language---but even that is a transliteration for the benefit of humans.  The machine---your computer---only understands 1's and 0's.

You can do a lot with high-level programming constructs, but when performance is critical, or you need to get down to the nitty-gritty for fine-tuned control, binary is your friend.  And naturally, Lisp makes it as simple as possible to work with binary data, whether working over a network, accessing the file system, or connecting to hardware with a driver.

In this chapter we will go into much more detail on the subject of binary streams, octet-vectors, and bit-vectors.  We've seen them all before, but only in passing---now it's time to take on the subjects of signed and unsigned bytes, little-endian and big-endian bit ordering, manipulating bits, conversion between bit-vectors, octet-vectors, and their integer equivalents, and of course, bit-wise logic and binary arithmetic.  We have also already covered the binary, octet, and hexadecimal notation system for integers, but a formal tour of those notations will also be helpful to this discussion, so we'll tackle that first.

This chapter will contain exercises on:

* Radix -- understanding the bases and orders of integers
* Representation of integers in byte-vectors
* Signed and Unsigned Bytes
* Big-Endian and Little-Endian bit ordering
* Creating byte-vectors
* Creating bit-vectors
* Manipulating Bits
* Bit-wise Logic
* Arithmetic on byte-vectors
* Arithmetic on bit-vectors
* Binary streams
* Binary network streams
* Extra Credit: Simulating hardware in Lisp
* Extra Credit: Implementing instruction-sets for hardware

<ul class="pager">
  <li class="previous"><a href="/book/2-08-0-number-theory/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/2-10-0-improved-text-adventure-engine/">Next &raquo;</a><li>
</ul>
