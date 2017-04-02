<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-02-00-input-output/">Printing, Strings, and Streams</a></li>
  <li class="active">Exercise 14: Pathnames</li>
</ol>

## Exercise 1.2.14

# Pathnames

Lisp has a special way of handling files from your computer: *pathname* objects. They allow Lisp to handle file-names, for the most part, in a platform-agnostic manner.  If they seem like overkill, just keep in mind how many different platforms and file-systems Lisp supports.

Pathname objects are represented using the reader macro syntax `#P"..."`; they look like strings preceded by a Sharpsign-P, but they have a lot of internal structure you have to know about.  Let's take a look at what you can get out of a seemingly simple pathname:

```lisp
(truename ".")

(pathname-directory (truename "."))

(pathname-host (truename "."))

(pathname-name (truename "."))

(pathname-type (truename "."))
```

You'll get `nil` back for `pathname-name` and `pathname-type`.  But now let's create a new file with your text editor named "llthw-ex-1-2-14.lisp" and save it in the folder on your computer you got back from `(truename ".")`. If you changed the default folder to open SBCL in, like you were instructed to, this should be your home folder, or a folder dedicated to your Lisp code.

In "llthw-ex-1-2-14.lisp" enter the following code and save it again:

```lisp
;; an empty Common Lisp file
```

Back at the REPL, try this now:

```lisp
(truename "llthw-ex-1-2-14.lisp")

(pathname-name (truename "llthw-ex-1-2-14.lisp"))

(pathname-type (truename "llthw-ex-1-2-14.lisp"))

(file-namestring (truename "llthw-ex-1-2-14.lisp"))
```

### What You Should See

Obviously, the exact pathnames you see will be personalized for your system.  Mine below are just for sake of example, so don't panic if you don't see *exactly* the same pathname objects that I have.

```lisp
* (truename ".")
#P"/home/colin/"
* (pathname-directory (truename "."))
(:ABSOLUTE "home" "colin")
* (pathname-host (truename "."))
#<SB-IMPL::UNIX-HOST {1000020BE3}>
* (pathname-name (truename "."))
NIL
* (pathname-type (truename "."))
NIL
```

After creating the file "llthw-ex-1-2-14.lisp" in the directory you got from `(truename ".")`:

```lisp
* (truename "llthw-ex-1-2-14.lisp")
#P"/home/colin/llthw-ex-1-2-14.lisp"
* (pathname-name (truename "llthw-ex-1-2-14.lisp"))
"llthw-ex-1-2-14"
* (pathname-type (truename "llthw-ex-1-2-14.lisp"))
"lisp"
* (file-namestring (truename "llthw-ex-1-2-14.lisp"))
"llthw-ex-1-2-14.lisp"
```

Do you understand what's going on here?  Take a moment to review to see if you can guess what everything is doing, and that all the code is returning what you think should be returned.

Let's start with the function `truename`.  You can see that it takes a regular string that represents, but isn't, a pathname object.  In fact, `truename` accepts any *pathname designator*, which can be a relative or full pathname namestring, a file stream, or an actual pathname object.

The rest of the new functions you've seen this exercise will only accept a pathname object, proper.  That is why you need to first call `truename` on the pathname designator strings above, to get a pathname object to pass to the pathname functions.

Notice the last function in the examples above, `file-namestring`? It gives you back just the file's namestring for a pathname object to a file.  If you give it a pathname object to a directory, it just returns an empty string, `""`. There are some other, similar functions related to it: `namestring`, `directory-namestring`, `host-namestring`, and `enough-namestring`.  Can you guess what they do?

### Extra Credit

Try out the extra namestring functions, `namestring`, `directory-namestring`, `host-namestring`, and `enough-namestring`.  Can you get them to run?  Can you predict the results you get from them?

<ul class="pager">
  <li class="previous"><a href="/book/1-02-13-more-format/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-15-streams.md">Next &raquo;</a><li>
</ul>
