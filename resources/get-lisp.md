<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li class="active">Get Lisp</li>
</ol>

Download and Installation instructions for Steel Bank Common Lisp on Windows, OS X, Linux, and Debian/Ubuntu

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

## FreeBSD/PCBSD

The FreeBSD (and thus PCBSD) ports contain SBCL. Just install it from the terminal via

```sh
$ sudo pkg install sbcl
```
