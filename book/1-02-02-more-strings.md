<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 2: More Strings</li>
</ol>

## Exercise 1.2.2

# More Strings

In Lisp, strings can contain just about any character, and what you type inside the double-quotes is exactly what you get.  Line-breaks and all.

Sometimes though, you want to include double-quote characters inside your string.  Lisp has a way of doing that, using the escape-character, `\`, the Backslash.

As it turns out, the backslash will escape *any* character.  So if you want to print a literal backslash, it too has to be escaped.

```lisp
* "this string contains \"double-quotes\"."
* "and this string has an escaped backslash: \\."
```

#### What You Should See

```lisp
* "this string contains \"double-quotes\"."

"this string contains \"double-quotes\"."
* "and this string has an escaped backslash: \\."

"and this string has an escaped backslash: \\."
```

Once again, you get back exactly what you typed.

<ul class="pager">
  <li class="previous"><a href="/book/1-02-01-strings/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-03-unicode/">Next &raquo;</a><li>
</ul>
