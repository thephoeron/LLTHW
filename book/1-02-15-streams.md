<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 15: Streams</li>
</ol>

## Exercise 1.2.15

# Streams

You've seen a little bit about streams already---just enough to print to `*standard-output*`.  But streams can do a lot more than that.  Streams are, simply put, the crux of I/O in Lisp.

Streams are objects, too, just like the character, string, integer, and pathname objects you've seen so far.  A stream can be designated just for input, just for output, or both.  Typically, streams accept only characters or bytes---so when you're printing a string to a stream, you are in fact *streaming* the sequence of characters that make up a string.

The idea of a stream is pretty simple to understand---if you've ever used YouTube or Netflix, you know that those services stream video to their users, so that you can start watching a video before the whole file has downloaded to your computer.  Streams in Lisp are no different---you send data to a stream, and a user listening on that stream gets the data as it becomes available.

Between bytes and characters, you can send any data you want over a stream.  Lisp makes it a cinch to read and write data for I/O.

### Making Streams

There are a few ways to make string streams manually for input and output; but bi-directional streams can only be made from existing input and output streams.  Try out the following code to get a feel for what streams do:

```lisp
(make-string-input-stream "hello?")

(read (make-string-input-stream "hello!"))

(with-input-from-string (s "It's the multiverse!")
  (read s))

(with-output-to-string (out)
  (with-input-from-string (in "\"Can I ask who's calling?\"")
    (let ((io (make-two-way-stream in out)))
      (format io "~A It's the Jovian moon, Io!" (read io)))))
```

### What You Should See

```lisp
* (make-string-input-stream "hello?")
#<SB-IMPL::STRING-INPUT-STREAM {1004CDF9B3}>
* (read (make-string-input-stream "hello!"))
HELLO!
* (with-input-from-string (s "It's the multiverse!")
    (read s))
IT
* (with-output-to-string (out)
    (with-input-from-string (in "\"Can I ask who's calling?\"")
      (let ((io (make-two-way-stream in out)))
        (format io "~A It's the Jovian moon, Io!" (read io)))))
"Can I ask who's calling? It's the Jovian moon, Io!"
```

Here you can see that it's pretty easy to create an input stream object from a string, but on its own all you get is the object itself returned.  What do you do with that?

The next example wraps the `make-string-input-stream` in a `read` form.  You haven't seen this before, but basically it's the entry point to the *Lisp Reader*, which I have mentioned in the context of printing.  Remember what I said about Lisp printing things *readably*?  Since the input you gave it doesn't have any extra escaped quotation marks, `read` thinks it's seeing a *symbol*.  So that's what you get back, the uninterned symbol `'HELLO!`.

You can see another side of this same point in the third example.  The `with-input-from-string` macro does a little bit more work for you than just creating an input stream---it also binds that stream to the local variable `s` for the body of the macro.  In this case, we just `read` from the stream bound to `s`.  And since `read` means have Lisp read it, it treats it as Lisp data, and parses the `IT` as a symbol, which ends at the single quote.  If you `read` from that stream three more times, you'd get the symbols `'S`, `THE`, and `MULTIVERSE!`.

Lastly, we create a bi-directional stream, writing to it and reading from it in a really silly way just because we can.  First, we create the output stream and bind it to a local variable `out`.  Second, we create an input stream from the string `"\"Can I ask who's calling?\""` and bind it to a local variable `in`.  Third, we make a bi-directional stream from those bound to `in` and `out`, and bind it to the local variable `io`.  Fourth, we use the `format` function to print to the bi-directional stream, feeding the data from the input stream back into the output stream.  All this is then returned by the outermost macro, `with-output-to-string`.  Notice how this time you got the whole string? That's because you entered the string object *readably* for the input stream.

In the next exercise, we'll look at creating, and reading and writing to binary streams from files on your computer.

<ul class="pager">
  <li class="previous"><a href="/book/1-02-14-pathnames.md">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-16-file-streams.md">Next &raquo;</a><li>
</ul>
