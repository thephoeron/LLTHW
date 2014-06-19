<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li class="active">Get Lisp</li>
</ol>

Download and Installation instructions for Steel Bank Common Lisp on Windows, OS X, Linux, and Debian/Ubuntu

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
