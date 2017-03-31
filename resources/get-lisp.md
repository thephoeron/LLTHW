<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li class="active">Get Lisp</li>
</ol>

<div class="alert alert-warning">
  <p>
  Common Lisp was designed as a platform-agnostic language, and through the whole book we promote this style of programming, independent of specific details of any particular implementation. However, for practical reasons, we have to choose a single implementation with which you'll actually learn from this book, and we pick SBCL as the implementation of choice.
  </p>
  <p>
  Do note, however, that as we stick to implementation-independent code examples, you'll have no troubles in case you choose different implementation. Most current ones at the end of 2015 are SBCL, <a href="http://ccl.clozure.com/">CCL</a>, <a href="https://common-lisp.net/project/ecl/">ECL</a> (compiles to native code), <a href="https://common-lisp.net/project/armedbear/">ABCL</a>  (based on Java runtime), <a href="http://franz.com/products/allegrocl/">Allegro</a> (commercial implementation number one) and <a href="http://www.lispworks.com/">LispWorks</a> (commercial implementation number two), and you can also try <a href="http://www.gnu.org/software/gcl/">GCL</a> (GNU implementation, unmaintained), <a href="http://www.clisp.org/">Clisp</a> (unmaintained) and <a href="https://github.com/drmeister/clasp">Clasp</a> (interoperates with C++, very recent) as well.
  </p>
</div>

**Following are download and installation instructions for Steel Bank Common Lisp on Windows, OS X, general Linux-based distro, and lastly Debian/Ubuntu in specific**

<div class="alert alert-info">
  <p>
    <strong>Note:</strong> the SBCL REPL is minimal by design, since it is primarily used from within Emacs+SLIME which provides its own custom prompt, history, completion, multi-line editing capabilities, and more.  In order to use it effectively straight from the command-line, you will need to install a separate tool on OS X and Linux called `rlwrap`, a readline wrapper. It provides evaluation history, multi-line editing, and can be configured for completions and filters.  You can read more about `rlwrap` here: <a href="http://utopia.knoware.nl/~hlub/uck/rlwrap/" target="_blank">utopia.knoware.nl/~hlub/uck/rlwrap/</a>.
  </p>
</div>

## Windows

Visit <http://www.sbcl.org/platform-table.html> and click the link for Windows under your platform column.  If you have a 64-bit version of Windows, be sure to download the version under the "AMD64" Column.

This link will download an installer to guide you through the installation and configuration process.  Once completed, you can run SBCL through the command-line, PowerShell, or from the Start Menu.

## OS X

The best way to get SBCL on your Mac is through the [Homebrew](http://brew.sh/#install) package manager.

Once Homebrew is installed and configured, you simply need to enter in the terminal:

```sh
$ brew install sbcl
```

You may wish to also install additional tools through Homebrew, such as `emacs` and `rlwrap`.

Alternatively, you can visit <http://www.sbcl.org/platform-table.html> and click the link for Darwin (Mac OS X) under your platform column.  Assuming you have Intel Mac hardware (2007 and newer), choose the link under the "AMD64" column.

## Linux

A recent version of SBCL is generally available in your distro's package manager.

For example, on Arch Linux:

```sh
$ sudo pacman -Syy sbcl
```

You may also wish to install additional tools such as `emacs` and `rlwrap`.

## Debian/Ubuntu

The version of SBCL available in the Debian repositories tends to be substantially out of date and not suitable for regular use.  However, you can install the version of SBCL from Apt and use it to cross-compile the latest version of SBCL from source.

* Visit <http://www.sbcl.org/platform-table.html> and click the link at the top of the page to download the latest source release, and unpack it in your user home directory.
* Install SBCL from the debian repositories
* Follow the instructions that come with the source release to compile the latest SBCL from source code.
