<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 15: Streams</li>
</ol>

# Exercise 1.2.15

## Streams

You've seen a little bit about streams already---but just enough to print to `*standard-output*`.  But streams can do a lot more than that.  Streams are, simply put, the crux of I/O in Lisp.

Streams are objects, too, just like the character, string, integer, and pathname objects you've seen so far.  A stream can be designated just for input, just for output, or both.  Typically, streams accept only characters or bytes---so when you're printing a string to a stream, you are in fact *streaming* the sequence of characters that make up a string.

The idea of a stream is pretty simple to understand---if you've ever used YouTube or Netflix, you know that those services stream video to their users, so that you can start watching a video before the whole file has downloaded to your computer.  Streams in Lisp are no different---you send data to a stream, and a user listening on that stream gets the data as it becomes available.

Between bytes and characters, you can send any data you want over a stream.  Lisp makes it a cinch to read and write data for I/O.

<ul class="pager">
  <li class="previous"><a href="/book/1-02-14-pathnames/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-16-file-streams/">Next &raquo;</a><li>
</ul>
