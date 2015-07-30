# LLTHW

[![Quicklisp](http://quickdocs.org/badge/llthw.svg)](http://quickdocs.org/llthw/)
[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/LispTO/llthw?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

```lisp
;; Welcome to L(λ)THW!
(let ((llthw '(learn lisp the hard way)))
  (format t "~{~@(~A~)~^ ~}, because ~{~A~^ ~} is easier!" llthw (cddr llthw)))

;; Common Lisp: Powerful, Expressive, Programmable, General Purpose, Multi-Paradigm.

```

Learn Lisp The Hard Way source-code and full book text. This is a work in progress, but you can read the draft online at http://learnlispthehardway.org/

Based on Zed Shaw's LxTHW Open-Source project for writing your own programming language book, available as a Git repository on Gitorious:

https://gitorious.org/learn-x-the-hard-way/learn-x-the-hard-way

More information on LxTHW is available at: http://learncodethehardway.org/

### Contribution Guidelines

It is the intention of the authors to bring this title to print, so please be aware that if you submit original content to the book text of Learn Lisp The Hard Way, you are implicitly agreeing to sign a contract and royalty schedule once the first edition of the book is complete.  However, there are many ways you can contribute to this project if you are not interested in being published and the legal obligations that come with it.

Technically, any open-source material which is relevant to the project and compatible with an MIT License can be contributed to the site and its additional resources (*i.e.*, everything except for the book proper), however, attribution is required and you should always check with the author or maintainer before submitting material which is not of your own creation.

As an LxTHW book, the style and format should follow [Zed Shaw's guidelines](https://gitorious.org/learn-x-the-hard-way/learn-x-the-hard-way/source/663fd4f6afd17f9d16fe10bafe3e64fdfb29e629:README) (under "Recommended Contents").  This is a show-don't-tell style, so the emphasis should be on source code examples that illustrate a point, and not a point that is illustrated by source-code.

The full book outline is already complete, so if you find a chapter that covers your specialty, you can claim it by creating an issue or a pull request on the repo.

Part Three of the book is designed for exploratory, self-directed, domain-specific projects.  Libraries, new programming techniques, and common problem domains tackled by Common Lisp are demonstrated, but the reader should be expected to figure out the implementation details on their own.

If you find any errors, or think a section could use more clarification or better code examples, please create an issue and identify the passage of text by chapter, exercise, and paragraph.

### Supporting this project

You can support this project with your donations:

PayPal: http://learnlispthehardway.org/donate/#paypal

Bitcoin: [17nWsM2aKqKewm7zDzv3mGUyqzKZKjsJGQ](bitcoin:17nWsM2aKqKewm7zDzv3mGUyqzKZKjsJGQ)

Litecoin: [LZfkNpcQetVcNNbpERQoCvRJkVERYry9Me](litecoin:LZfkNpcQetVcNNbpERQoCvRJkVERYry9Me)

### License

Copyright &copy; 2012--2015, "the Phoeron" Colin J.E. Lupton and the Authors.  The web site and source code have been released under the MIT License; please see `llthw/LICENSE` for more information.

The book text of Learn Lisp The Hard Way is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nd/4.0/">Creative Commons Attribution-NoDerivatives 4.0 International License</a>.
