<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-0-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 3: Unicode and Strings</li>
</ol>

# Exercise 1.2.3

## Unicode and Strings

Generally speaking, strings in Common Lisp are UTF-8/Unicode by default.  This is not a guarantee, however; it's typically just a default on most implementations of Lisp on platforms that support it.

You can do a quick check to see if your implementation of Lisp supports Unicode or not.

```lisp
* char-code-limit
```

If that *constant variable* returns `1114112`, then you're in luck! You have full Unicode support.  If it's less than that, you may be more limited in what you can do with strings.

<div class="alert alert-info" role="alert">
  <strong>Note:</strong> Unless you plan on working with a lot of different character sets, you'll probably never notice the full Unicode support, when present.
</div>

<ul class="pager">
  <li class="previous"><a href="/book/1-02-02-more-strings/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-04-chars/">Next &raquo;</a><li>
</ul>
