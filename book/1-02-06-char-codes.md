<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-0-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 6: Character Codes</li>
</ol>

# Exercise 1.2.6

## Character Codes

Character objects all have numeric values, called `codes`, corresponding to either the code-points in the Unicode table, or the current encoding of your running Lisp image.  Lisp comes with a lot of useful tools for working with characters and strings as numbers and vectors/arrays, and where the standard falls short, there are several popular libraries you can always rely on.

You can get the code for a character object with the function `char-code`, and the character object for a code with `code-char`, as follows:

```lisp
(code-char #x61)
(char-code #\a)
```

<div class="alert alert-info">
  See the symbol `#x61` in the example above? That's the hex-number `0x61`, which is `97` in decimal. Sometimes it's more convenient to reference integers using a different notation than decimal.  The Unicode tables are listed using hexadecimal (base-16), for instance---so you can just type the hex-number using the Sharpsign-X syntax.  There will be more discussion on numbers and notation in Chapter 1.6.
</div>

#### What You Should See

```lisp
* (code-char #x61)
#\a
* (char-code #\a)
97
```

<ul class="pager">
  <li class="previous"><a href="/book/1-02-03-unicode/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-03-0-getting-input-from-users/">Next &raquo;</a><li>
</ul>
