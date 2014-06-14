### Let's do a little math

Every piece of code you write in Lisp is an *Expression*.  An expression can either be an atom or a list, and always returns a value when it is evaluated.

At the prompt, type: `(+ 1 1)` &mdash; that expression is a list. Each element of the list is also an expression.  It evaluates to, or "returns", `2`, the result of passing the arguments `1` and `1` to the addition function, `+`.

Now type: `2` &mdash; this expression is an atom.  It self-evaluates: *i.e.*, it returns itself.

<p class="text-right">
  <a class="btn btn-primary" id="try-lisp-next" href="/try-lisp/math/">Next &raquo;</a>
</p>
