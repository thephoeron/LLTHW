<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 7: Strings From Characters</li>
</ol>

## Exercise 1.2.7

# Strings From Characters

Most of the time, you'll want to work with strings instead of characters.  You can get a one-character string object directly from a character object by calling the `string` function on it:

```lisp
(string #\greek_small_letter_lamda)
```

But the `string` function only takes one argument, a character or a string, and isn't very smart.  It doesn't know how to do much in terms of type conversion.

It's also easy to get a string from a list of characters.  Remember the `coerce` function introduced in exercise 1.2.4? You can change the type argument from `'list` to `'string`, and then the `coerce` function knows you want convert the list into a sequence of type string:

```lisp
(coerce '(#\( #\greek_small_letter_lamda #\)) 'string)
```

#### What You Should See

```lisp
* (string #\greek_small_letter_lamda)
"λ"
* (coerce '(#\( #\greek_small_letter_lamda #\)) 'string)
"(λ)"
```

<ul class="pager">
  <li class="previous"><a href="/book/1-02-06-char-codes.md">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-08-printing.md">Next &raquo;</a><li>
</ul>
