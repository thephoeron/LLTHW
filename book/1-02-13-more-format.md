<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 13: A Little Bit More on Format</li>
</ol>

## Exercise 1.2.13

# A Little Bit More on Format

Now that you've seen how the `format` function works, we'll go through a few more control sequences that you might find useful.  Again, the full tour of format string syntax won't be coming until chapter 1.18, but this should give you enough to work with for now.

Try these examples out, and see if you can guess what these format control sequences do.  They will be explained afterwards, but don't cheat---try them out, and see if you can guess what they do before you read on past the example.

```lisp
(format nil "~~")

(format nil "H~CO" #\subscript_two)

(format nil "~R" 10000)

(format nil "~X" 10000)

(format nil "~D" 10000)

(format nil "~O" 10000)

(format nil "~B" 10000)

(format nil "~%Hello, ~A!" "Colin")

(format nil "~&I said, hello!")
```

#### What You Should See

```lisp
(format nil "~~")
"~"
CL-USER> (format nil "H~CO" #\subscript_two)
"H₂O"
CL-USER> (format nil "~R" 10000)
"ten thousand"
CL-USER> (format nil "~X" 10000)
"2710"
CL-USER> (format nil "~D" 10000)
"10000"
CL-USER> (format nil "~O" 10000)
"23420"
CL-USER> (format nil "~B" 10000)
"10011100010000"
```

Did you guess everything correctly?  If not, don't panic.  Look over what you typed and the return results, and see now if you can infer what was printed to the string.

Much like with the backslash character in a regular string, you can include a tilde character in a format string with the *tilde-tilde* control sequence, `~~`.  It doesn't consume any arguments.

You can consume a character object argument using `~C`.

You can insert an integer into a format string with `~R`, but since it can be a bit overkill with its flexibility, there are also simplified control sequences for printing the integer to hexadecimal, decimal, octet, and binary, like we did with `write` earlier: `~X`, `~D`, `~O`, and `~B`, respectively.  They all consume an argument, which must be an integer.

You can force the insertion of a `#\Newline` character with `~%`.  It doesn't consume any arguments.

And you can insert a `#\Newline` only if the output stream is not already at the beginning of a line with `~&`.  It doesn't consume any arguments either.

<ul class="pager">
  <li class="previous"><a href="/book/1-02-12-format/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-14-pathnames/">Next &raquo;</a><li>
</ul>
