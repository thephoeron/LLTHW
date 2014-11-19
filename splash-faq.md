## Frequently Asked Questions

<h4 class="text-info">What is Lisp?</h4>

Lisp---the nickname for the ANSI Standardized general purpose programming language *Common Lisp*---is a member of the Lisp-family of programming languages that descends from the original LISP language proposed by John McCarthy in the 1950s.  All Lisp-family languages share common features, such as the S-Expression syntax based on a subset of Lambda Calculus and Polish prefix notation, but Common Lisp in particular is known for its concise syntax, extensibility, multi-paradigm approach to programming, and macro system.

Common Lisp is actively supported in both commercial and open-source implementations, available for nearly every platform (coming to new ones all the time), has a lively community and a large and actively maintained collection of user-contributed libraries.

<h4 class="text-info">Who should learn Lisp?</h4>

Complete beginners to programming, who want to be assured of learning a powerful language that will help them develop unique insights of their field.  Someone who has struggled with programming before.  Hobbyists, who are looking for a new challenge.  A professional developer looking to take their performance and productivity to the next level. In a word, everyone.

<h4 class="text-info">Is Lisp as hard as people say it is?</h4>

No. Lisp is actually the simplest programming language, and has no syntactic cruft.  While it wasn't designed to be "easy to learn" like Swift, Python, Ruby, or Basic, there is less overall to learn and you will be writing real, useful programs in Lisp sooner than you could with other languages.

<h4 class="text-info">What do I need to know <em>before</em> learning Lisp?</h4>

Lisp, like all other programming languages, requires a certain degree of advanced computer skills. You should be a strong typist, comfortable in a variety of text editors, and know how to use the command line to run text-based applications and compile software from source code.  In addition, up-front familiarity with powerful programmer's text editors such as Emacs or VIM will help you be more productive through Lisp's incremental, interactive development cycle---but for now all you really need to know is how to enter text into a file, save it to disk, and run it from the command line.

<h4 class="text-info">What do I need to learn Lisp with this site?</h4>

You can get started learning Lisp right away, without downloading anything; just visit the [Try Lisp](/try-lisp/) page and follow the instructions to get going with the in-browser Lisp REPL.  All you need is a relatively recent browser, such as Chrome, Firefox, Safari, or IE 10+.

To write and distribute your own Lisp software, however, you will need a computer where you have the administrative rights to install software without anyone else's help.  Pretty much any personal computer will do, Lisp runs everywhere, on Windows, Mac OS X, Linux, and UNIX.  Complete instructions for setting up your development environment are included in the preface of the book.

<h4 class="text-info">Why don't all the exercises in the book work on the Try Lisp page?</h4>

The in-browser REPL on the Try Lisp page is <a href="https://github.com/davazp/jscl" target="_blank">powered by JSCL</a>; it's not a complete implementation of Common Lisp yet, and is only intended to get new students of Lisp familiarized with working at a REPL.

When using the in-browser REPL, be sure to follow the examples listed in that section.  When you're ready to start the book, you will need to follow the instructions to install SBCL first.

<h4 class="text-info">What is Lisp used for?</h4>

Common Lisp is an ANSI standardized high-level, general purpose, dynamic, multi-paradigm, programmable programming language.  So any application, script, or web site can be written in Lisp, generally in less time and with substantially fewer lines of code than could be achieved with other programming languages.

Some of the most exciting projects in the history of computing are being developed in Lisp right now.  In fact, Common Lisp is still the most advanced, robust, expressive, and powerful programming language ever invented, giving it an edge both in everyday programming challenges as well as exploratory programming; and its ANSI standardization gives it a stability that no other language can match, meaning your code is far less susceptible to bit-rot over time.

<h4 class="text-info">Is Lisp a functional programming language?</h4>

This is a common misconception, but no, it is not.  Functional programming is a style of writing code, a *paradigm*, based on the lambda calculus, where the programmer aims to eliminate side-effects and reduce software to mathematical purity.  This means that a function is not permitted to change state outside of its lexical scope, and that if it is run multiple times with the exact same parameters, it will always return the same result.

Common Lisp is not a 'pure' functional language, however, such as Haskell; it is multi-paradigm like OCaml.  You can choose to use the functional paradigm in Common Lisp if you like, but you can also use Procedural, Object-Oriented, Event-Oriented, novel new paradigms like Aspect-Oriented, or mix and match to your hearts content.  Strict Functional programming languages do not offer this flexibility.

<h4 class="text-info">What kind of programs will I learn to write with this book?</h4>

In this course, we will be writing command-line applications, text-based adventure games, web applications, cross-platform desktop software, native apps for mobile devices, 2D and 3D games, and exploring advanced use cases in the industries that favour Lisp over other programming languages&mdash;specifically, enterprise, big data, financial services, natural language processing, robotics, space tech, artificial intelligence, neuroscience, quantum computing, cryptography/security, government and military, exploratory programming, and academic research such as computational physics.

<h4 class="text-info">What about other Lisp-family languages, like Scheme or Clojure? Will this site teach me them too?</h4>

The focus of this site is entirely on Common Lisp.  While all Lisp-family languages share certain common features, such as the S-Expression syntax, Scheme and Clojure are very different languages than Common Lisp in practice.  That being said, you will be better equipped to learn Scheme or Clojure after learning Common Lisp first, and have a better understanding of when Scheme or Clojure is a better choice for a specific project.

<h4 class="text-info">Is this site affiliated with Zed Shaw and Learn Code The Hard Way?</h4>

No.  This is a separately run and managed site, based on the format of Zed Shaw's <a href="https://gitorious.org/learn-x-the-hard-way/learn-x-the-hard-way" target="_blank">LxTHW</a> open-source package for writing your own programming language course.  You should check out the project and see what others are up to! More information is available at: <a href="http://learncodethehardway.org/" target="_blank">Learn Code The Hard Way</a>.
