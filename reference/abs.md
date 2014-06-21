#### <em>function</em> <strong>`abs`</strong>

**Syntax:** <strong>`abs`</strong> *number* => *number*

**Description:**

Returns the absolute value of the argument. For a non-complex number *x*,

```lisp
(abs x) == (if (minusp x) (- x) x)
```

and the result is always of the same type as the argument.

For a complex number *z*, the absolute value may be computed as

```lisp
(sqrt (+ (expt (realpart z) 2) (expt (imagpart z) 2)))
```

*Text from [CLTL2](http://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node128.html)*.

**Examples:**

```lisp
(abs -4.0) => 4.0

(abs -1) => 1

(abs #c(3.0 -4.0)) => 5.0

```
