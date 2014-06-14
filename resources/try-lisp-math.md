### Let's do a little math

The prefix notation of Lisp can throw some people off at first, but it actually makes math easier.  You've already seen the addition function, `+`. Now try this:

`(+ 1053 46 78 372 5000)`

Isn't that easier than having to type "1053 + 46 + 78 + 372 + 5000", like you would have to in other languages? Now try these:

`(- 9 3)`

`(* 9 3)`

`(/ 9 3)`

`(expt 3 3)`

`(mod 3142 60)`

Prefix notation and expressions also make order of operation clearer:

`(* (+ 10 2) (mod 3142 60))`

The innermost expression is evaluated first.

<p class="text-right">
  <a class="btn btn-primary" id="try-lisp-next" href="/try-lisp/math/">Next &raquo;</a>
</p>
