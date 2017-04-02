<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 17: Binary Streams</li>
</ol>

## Exercise 1.2.17

# Binary Streams

You might find the subject of Binary Streams a little esoteric at such an early stage in your Lisp experience, but we'll only be touching on them lightly, just to show you that they're there.

Working with Binary Streams in general is very similar to working with file streams. You open an input, output, or bi-directional file stream, and you simply specify that you're working with bytes.  In the last exercise, we didn't specify a type for input and output, and thus used the default character stream for files.

```lisp
(with-open-file (b "~/binary-monkey.txt" :direction :output :element-type 'unsigned-byte :if-exists :supersede)
  (write-byte 109 b)
  (write-byte 111 b)
  (write-byte 110 b)
  (write-byte 107 b)
  (write-byte 101 b)
  (write-byte 121 b))
```

### What You Should See

```lisp
* (with-open-file (b "~/binary-monkey.txt" :direction :output :element-type 'unsigned-byte :if-exists :supersede)
    (write-byte 109 b)
    (write-byte 111 b)
    (write-byte 110 b)
    (write-byte 107 b)
    (write-byte 101 b)
    (write-byte 121 b))
121
```

Now go to the file `~/binary-monkey.txt` on your computer, and open it in a text editor.  What do you see? Is it what you expected or a complete surprise?

If all went well, you should have a file that just contains the word "monkey".  Remember, everything in a computer is really stored and run in binary---everything else is just a representation for our benefit, to make working with computers easier and friendlier.  But it helps to remember this point.  You won't normally want to read and write to text files in binary, but for many other file formats and network protocols, this is the best way to work with them.

When you set the element-type of the file stream to unsigned-byte, that allowed you to use `write-byte` on the stream.  Lisp also lets you represent bytes as integers.  So when you wrote those numbers to the text file, you were really writing the character bytes to that text file that spelled out the word "monkey".  You could also have used the hexadecimal, octal, or binary representation of the integers, as I showed you in exercise 1.2.8.

### Extra Credit

Rewrite the above example three times to use a `do` loop I showed you before, and a list of the numbers 109, 111, 110, 107, 101, and 121; represent these integers in hexadecimal, octal, and binary notation, respectively.

If you do it right, you should only have to call the `write-byte` function once in your `do` loop.

Also write the code to read the file back into Lisp as a string, and transform it into ALL-CAPS.  Hint: you can do this either with `format` or the function `string-upcase`.

<ul class="pager">
  <li class="previous"><a href="/book/1-02-16-file-streams.md">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-18-prompting-users.md">Next &raquo;</a><li>
</ul>
