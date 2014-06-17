<p class="lead">I know you're itching to dive right in to Common Lisp, so let's get started!</p>

### How to use JSCL

<kbd>&uarr;</kbd>, <kbd>&darr;</kbd> to navigate evaluation history.

<kbd>&#x21e7; Shift + &#x21b2; Return</kbd> to continue typing on the next line.

<kbd>&#x21b2; Return/Enter</kbd> to evaluate what you've entered.

The REPL runs in your browser, never communicating with the server.  The history is stored on your computer.

### Now let's get coding!

Every piece of code you write in Lisp is an *Expression*.  An expression can either be an atom or a list, and always returns a value when it is evaluated.

At the prompt, type: `(+ 1 1)` &mdash; that expression is a list. Each element of the list is also an expression.  It evaluates to, or "returns", `2`, the result of passing the arguments `1` and `1` to the addition function, `+`.

Now type: `2` &mdash; this expression is an atom.  It self-evaluates: *i.e.*, it returns itself.

<p class="text-right">
  <a class="btn btn-primary" id="try-lisp-next" href="/try-lisp/math/">Next &raquo;</a>
</p>
