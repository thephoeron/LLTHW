<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li><a href="/book/1-01-00-lisp-bootcamp/">Common Lisp Bootcamp</a></li>
  <li class="active">Configuring Your Development Environment</li>
</ol>

# Configuring Your Development Environment

> "Free will is a golden thread running through the frozen matrix of fixed events."
> <footer>Robert A. Heinlein, <em>The Rolling Stones</em></footer>

Now that you've gotten yourself a feel for Common Lisp, you'll want to spend a little time configuring your development environment so that you can dive right into the code.  A lot of configuration choices are a matter of personal taste, but as long as you feel comfortable, and nothing interferes with your ability to learn and hack in Lisp, you can't really go wrong.

## The In-Browser REPL

You can start hacking in Lisp right away with the in-browser, javascript-powered REPL under the "Try Lisp" section of this site, listed in the navigation bar at the top of each page.  It takes you through a quick tour of Common Lisp so you can get your feet wet without installing anything.

## Installing SBCL

Steel Bank Common Lisp is one of the easiest Lisp implementations to get up and running&mdash;it has out of the box support for a wide selection of platforms, and is considered to be the most robust implementation available.  Since it automatically compiles everything you enter at the REPL, your running Lisp processes also benefit from a major speed-boost over other Lisps.

<div class="alert alert-info">
  <p>
    <strong>Note:</strong> the SBCL REPL is minimal by design, since it is primarily used from within Emacs+SLIME which provides its own custom prompt, history, completion, multi-line editing capabilities, and more.  In order to use it effectively straight from the command-line, you will need to install a separate tool on OS X and Linux called `rlwrap`, a readline wrapper. It provides evaluation history, multi-line editing, and can be configured for completions and filters.  You can read more about `rlwrap` here: <a href="http://utopia.knoware.nl/~hlub/uck/rlwrap/" target="_blank">utopia.knoware.nl/~hlub/uck/rlwrap/</a>.
  </p>
</div>

### Windows

The latest SBCL installer packages for Windows, in separate versions for 32 and 64-bit systems, are available on the official downloads page.

Once installed, you can run SBCL from the Start menu, or call it from a command-line window.  If you have PowerShell installed, it offers better features than the default command line.

### OS X

On Mac OS X, you will want to install SBCL through the Homebrew package manager.

You will also want to install the `rlwrap` package, and run SBCL from the terminal as follows:

```sh
$ rlwrap sbcl
```

### Linux

Most Linux distros have the latest, or a very recent, version of SBCL in their official repositories.  You can simply install it from there.

You will also want to install the `rlwrap` package, and run SBCL from the shell as follows:

```sh
$ rlwrap sbcl
```

### Debian/Ubuntu

The packages for SBCL in Apt tend to be severely out-of-date, so if you're using Debian or Ubuntu, you will have a little extra work to do.

First, install the version of SBCL available for your distro in Apt.

Using the old version of SBCL, you may now compile the latest version of SBCL from source.

## Installing Quicklisp

Once you have SBCL up and running, the first thing you should do is install Quicklisp.  It's a package manager for Lisp, and will allow you to dynamically load community-supported libraries (which typically include ASDF systems and their associated Lisp packages) into your running Lisp image.  It also automatically resolves dependencies for your own Lisp projects.

From the command-line:

```sh
$ curl -O http://beta.quicklisp.org/quicklisp.lisp
$ rlwrap sbcl --load quicklisp.lisp
```

You will then find yourself at the Lisp REPL, with some instructions:

```lisp
  ==== quicklisp quickstart loaded ====
  
    To continue, evaluate: (quicklisp-quickstart:install)
```

Like the instructions tell you, type that at the REPL prompt:

```lisp
* (quicklisp-quickstart:install)
```

Once it finishes downloading its dependencies and setting up the working folders, it will prompt you with another message confirming it was installed.  Now you will want to set it up to load automatically every time you start SBCL:

```lisp
* (ql:add-to-init-file)
```

This function will tell you exactly what it's doing before it changes your lisp `.*rc` file.  If you're ready, press Enter to continue when it prompts you to do so.

That's it!  You can now use `ql:system-apropos` to search for libraries, and `ql:quickload` to download and install them.

You can put your Lisp projects under `~/quicklisp/local-projects/` so that Quicklisp can find them automatically; then you will be able to quickload your own projects just like the libraries distributed with Quicklisp.

## Choosing a Text Editor

If you ask any Lisp developer what editor you should be using, or what IDE is available for Common Lisp, the first thing they'll tell you is, Emacs.  Emacs and SLIME (the Superior Lisp Interaction Mode for Emacs), makes a powerful combination. You can control the entire environment with your keyboard, never having to waste time reaching for the mouse; run, test, and debug code in the REPL as you write it in another buffer; experiment and explore alternate approaches to solving the same problem, profiling your code to get the best performance; and have the full Common Lisp HyperSpec at your fingertips.  The only problem is, some users really dislike Emacs, or simply don't know it.  The steep learning curve can be a real damper to your progress when coming to both Lisp and Emacs as a newbie; so the policy of this book is, use what you know, and make it work until you know Lisp well enough to get comfortable learning Emacs.  If you wait until the right time, learning Emacs will be a boost to your productivity, not a hindrance.

If you know Emacs and have a great disdain for it, far preferring Vim, you can take advantage of most of the features of SLIME through the Vim package, Slimv.

For users who have no experience with Emacs or Vim, all you really need at the moment is a simple text editor.  Anything more will probably just confuse you, and keep you from focusing on Lisp itself.  A few worth checking out are:

* Sublime Text: very well supported, extensible, and actively maintained; syntax highlighting for Lisp is built-in; a REPL plugin is available so you can get a similar experience to Emacs without as steep a learning curve.  Free to try, but requires a paid license for continued use.  It is available to download for Windows, OS X, and Linux.
* Atom: currently in beta, built entirely on Web technologies, GitHub's Atom Editor is like a stripped-down Sublime Text with a few unique features. A plugin for Lisp syntax highlighting is available for download within the editor settings.  The binary is available to download for OS X, and the source code is available to compile for other systems.
* Cloud9: the Cloud9 service is like Sublime Text or Atom in the browser.  You can access your code from anywhere, sync it up with your repo, collaborate on code, and more.  Syntax highlighting for Lisp is built-in.  Cloud9 has both free and premium plans.  Best viewed in Chrome, Safari, and Firefox.
* Notepad++: A clean and simple text editor with syntax highlighting for Lisp.  Available for Windows.

Other popular text and code editors, such as BBedit, TextWrangler, and Gedit, do not have syntax highlighting for Lisp.

## Working From the Command-Line

Importance of being comfortable with the Command-Line

Running and Compiling Lisp from the Command-Line

Lisp shell scripts

Launching the REPL

## Tour of the REPL

The READ-EVAL-PRINT Loop

Printed output vs. Return values

Error-handling, Conditions, and Debugging

<ul class="pager">
  <li class="previous"><a href="/book/1-01-03-style-guide/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-02-00-input-output/">Next &raquo;</a><li>
</ul>
