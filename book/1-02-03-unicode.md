<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 3: Unicode and Strings</li>
</ol>

## Exercise 1.2.3

# Unicode and Strings

Generally speaking, `string` objects in Common Lisp are Unicode by default, encoded as UTF-8.  This is not a guarantee, however; it's typically just a default on most implementations of Lisp on platforms that support it.

You can do a quick check to see if your implementation of Lisp supports Unicode or not.

```lisp
* char-code-limit
```

If that *constant variable* returns `1114112`, then you're in luck! You have full Unicode support.  If it's less than that, you may be more limited in what you can do with strings.

In SBCL, you can test specifically for Unicode support using Lisp's read-time conditionals (but this feature test is not portable):

```lisp
* #+sb-unicode (format nil "~C" #\cuneiform_sign_an_plus_naga_opposing_an_plus_naga)
```

This code will only return a string of the cuneiform sign if you are using SBCL and you have Unicode support enabled; if you also want to see the cuneiform sign, and not a numbered Unicode box character, you have to install cuneiform fonts as well.

On Arch Linux, the `ttf-akkadian` package is available in AUR.  For other platforms, you can find up-to-date links for Sumerian, Akkadian, Old Babylonian, and Neo-Assyrian fonts from the Wikipedia article for the <a href="http://en.wikipedia.org/wiki/Cuneiform_%28Unicode_block%29#Font_packages" target="_blank">Cuneiform (Unicode block)</a>.

<div class="alert alert-info" role="alert">
  <strong>Note:</strong> Unless you plan on working with a lot of different character sets, you'll probably never notice the full Unicode support, when present.
</div>

<ul class="pager">
  <li class="previous"><a href="/book/1-02-02-more-strings/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-04-chars.md">Next &raquo;</a><li>
</ul>
