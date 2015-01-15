<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 5: More Characters</li>
</ol>

## Exercise 1.2.5

# More Characters

While not portable, and not part of the Common Lisp standard, in SBCL and a few other Lisp implementations, you can refer to any character beyond the ASCII-range using a character object with its Unicode name, simply replacing the space word-separators with underscores (`_`).  This is a little unusual for the Lisp world, since symbol names normally use the `-` (hyphen/dash) character as the word-separator; but as I said in Section 1.1.3, the Common Lisp Style Guide, that is a naming convention, which in this case isn't followed.

Some of these characters you've seen before, but lets go through a few so you get used to typing them out:

```lisp
#\subscript_three
#\greek_small_letter_lamda
#\greek_capital_letter_sigma
#\cuneiform_sign_an_plus_naga_opposing_an_plus_naga
```

These names are not case-sensitive: you could type `#\Greek_Small_Letter_Lamda`, `#\GREEK_SMALL_LETTER_LAMDA`, or even `#\gReEK_sMaLl_LeTtER_lAmDA`, and the Lisp reader will see it the same---for style and legibility of your code, however, you should stick with the lower-case names. You can use this syntax to enter any Unicode character into the SBCL REPL.

#### What You Should See

```lisp
* #\subscript_three
#\SUBSCRIPT_THREE
* #\greek_small_letter_lamda
#\GREEK_SMALL_LETTER_LAMDA
* #\greek_capital_letter_sigma
#\GREEK_CAPITAL_LETTER_SIGMA
* #\cuneiform_sign_an_plus_naga_opposing_an_plus_naga
#\CUNEIFORM_SIGN_AN_PLUS_NAGA_OPPOSING_AN_PLUS_NAGA
```

When you enter a character object at the REPL, it returns itself.  When you want the character's glyph, *i.e.*, what it will look like in a string, you need to put the character into a string.  This will be covered in a later exercise.

<div class="alert alert-warning">
  <strong>Note:</strong>
  <p>You've probably noticed that the Greek letter lambda's name is "misspelled" in the example above. It's not a mistake, this is the actual character name in the Unicode standard, because the name of the letter is no longer spelled with the letter <em>beta</em> following the <em>mu</em> in modern Greek.</p>
  <p>This is a good opportunity to remind you to type in exactly, character for character, what I have in the example code into the REPL. Did you get an error when typing the above example? Check what you typed, and make sure you typed exactly what you're supposed to.</p>
</div>

<ul class="pager">
  <li class="previous"><a href="/book/1-02-04-chars/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-06-char-codes/">Next &raquo;</a><li>
</ul>
