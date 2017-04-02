<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 16: File Streams</li>
</ol>

# Exercise 1.2.16

## File Streams

To read from and write to files on your computer with Lisp, you create a *file-stream* object.  While similar in principle to string streams, there's stuff you can do with file streams that you can't do with string streams.

Like with string streams, you can create file streams manually with `open`. But for now let's look at the simplest use-case, creating a file using the `with-open-file` macro and putting some text in it; then we'll read that text back using the same macro and print it in the REPL.

```lisp
(with-open-file (s "~/monkey.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
  (format s "I had a little monkey,~%Brought him to the country,~%Fed him on ginger-bread...~%"))

(with-open-file (s "~/monkey.txt" :direction :input)
  (format t "~&;;; ~A" (read-line s)))

(with-open-file (s "~/monkey.txt" :direction :input)
  (do ((line (read-line s) (read-line s nil 'eof)))
      ((eq line 'eof) "-- Marilyn Manson")
    (format t "~&;;; ~A~%" line)))
```

<div class="alert alert-info">
  <strong>Note:</strong>
  <p>No animals were harmed in the making of this exercise.</p>
</div>

### What You Should See

```lisp
* (with-open-file (s "~/monkey.txt" :direction :output :if-does-not-exist :create :if-exists :supersede)
    (format s "I had a little monkey,~%Brought him to the country,~%Fed him on ginger-bread...~%"))
NIL
* (with-open-file (s "~/monkey.txt" :direction :input)
    (format t "~&;;; ~A" (read-line s)))
;;; I had a little monkey,
NIL
* (with-open-file (s "~/monkey.txt" :direction :input)
    (do ((line (read-line s) (read-line s nil 'eof)))
        ((eq line 'eof) "-- Marilyn Manson")
      (format t "~&;;; ~A~%" line)))
;;; I had a little monkey,
;;; Brought him to the country,
;;; Fed him on ginger-bread...
"-- Marilyn Manson"
```
First up, you might want to take this opportunity to browse your file system and verify that the file `monkey.txt` was actually created in your Home directory.  You should be able to open it with any text editor you want and see what you wrote to it.  Cool, eh?  Any time you're at the REPL, and want to make a note of something, you can use this code to leave yourself a reminder.

As I said above, you can create either an input or output file stream using the function `open`; but if you do it manually, you have to remember to close it as soon as you've finished writing to it or reading from it.  The `with-open-file` macro opens and closes the file for you, and gives you a stream to work with in its body.  It's much more convenient and better reflects the Lisp Way.

Don't worry too much about the `do` loop constructor I've introduced; all you need to know for now is that it iterates over the lines in the file you opened until it reaches the end-of-file.  Once it does, you can set something to be returned---which in this case is just a string.

In the next exercise, we'll be dipping our toes into *binary streams*.

<ul class="pager">
  <li class="previous"><a href="/book/1-02-15-streams.md">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-17-binary-streams.md">Next &raquo;</a><li>
</ul>
