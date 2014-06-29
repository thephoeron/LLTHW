## Frequently Asked Questions

<h4 class="text-info">Why would I want to learn Lisp? Isn't it a dead language?</h4>

The first Lisp-family language, LISP, is almost 60 years old, but when people talk about Lisp now they are referring specifically to Common Lisp, the ANSI standardized high-level, general purpose, dynamic, multi-paradigm, programmable programming language.  It is far from dead&mdash;it is actively supported in both commercial and open-source implementations, available on nearly every platform (and coming to new ones all the time), has a lively community and a large and actively maintained collection of libraries.

Some of the most exciting projects in the history of computing are being developed in Lisp right now.  In fact, Common Lisp is still the most advanced, robust, expressive, and powerful programming language ever invented, giving it an edge both in everyday programming challenges as well as exploratory programming; and its ANSI standardization gives it a stability that no other language can match, meaning your code is far less susceptible to bit-rot over time.

<h4 class="text-info">I've heard Lisp is really hard&mdash;don't you have to be a genius to learn it?</h4>

No. Lisp is actually the simplest programming language, and has no syntactic cruft.  While it wasn't designed to be \"easy to learn\" like Swift, Python, Ruby, or Basic, there is less overall to learn and you will be writing real, useful programs in Lisp sooner than you could with other languages.

<h4 class="text-info">I've heard Lisp is a functional programming language.  What's that mean?</h4>

Functional programming is a style of writing code, a paradigm, based on the lambda calculus, where the programmer aims to eliminate side-effects and reduce software to mathematical purity.  This means that a function can't change state outside of its lexical scope, and that if it is run multiple times with the exact same parameters, it will always return the same result.

Common Lisp is not a strict functional language, though, like Scheme, Racket, or Haskell, it's multi-paradigm like OCaml.  You can choose to use the functional paradigm if you like, but you can also use Procedural, Object-Oriented, Event-Oriented, novel new paradigms like Aspect-Oriented, or mix and match to your hearts content.  Functional programming languages do not offer this flexibility.

<h4 class="text-info">Ok, Lisp sounds pretty cool&mdash;but what can I <em>do</em> with it?</h4>

Common Lisp is a powerful, extensible language.  Any application or script, on any platform, can be written in Lisp, usually in less time and with substantially fewer lines of code.  In this course, we will be writing command-line applications, text-based adventure games, web applications, cross-platform desktop software, native apps for mobile devices, 2D and 3D games, and exploring advanced use cases in the industries that favour Lisp over other programming languages&mdash;specifically, enterprise, big data, financial services, natural language processing, robotics, space tech, artificial intelligence, neuroscience, quantum computing, cryptography/security, government and military, exploratory programming, and academic research such as computational physics.

<h4 class="text-info">What about other Lisp-family languages, like Scheme or Clojure? Will this course teach me them too?</h4>

The focus of this site is entirely on Common Lisp.  While all Lisp-family languages share certain common features, such as the S-Expression syntax, Scheme and Clojure are very different languages than Common Lisp in practice.  That being said, you will be better equipped to learn Scheme or Clojure after learning Common Lisp first, and have a better understanding of when Scheme or Clojure is a better choice for a specific project.

<h4 class="text-info">Is this site affiliated with Zed Shaw and Learn Code The Hard Way?</h4>

No.  This is a separately run and managed site, based on the format of Zed Shaw's <a href="https://gitorious.org/learn-x-the-hard-way/learn-x-the-hard-way" target="_blank">LxTHW</a> open-source package for writing your own programming language course.  You should check out the project and see what others are up to! More information is available at: <a href="http://learncodethehardway.org/" target="_blank">Learn Code The Hard Way</a>.
