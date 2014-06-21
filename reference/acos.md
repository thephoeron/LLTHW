### <em>function</em> <strong>`acos`</strong>

**Syntax:** <strong>`acos`</strong> <em>number</em> => <em>number</em>

**Description:**

`acos` returns the arc cosine of the argument *number*. The result is in radians. The argument may be complex.

The arc cosine function may be defined mathematically for an argument *z* as follows:

\`-i log(z + root i (1-z^2))\`

Note that the result of `acos` may be complex even if the argument is not complex; this occurs when the absolute value of the argument is greater than 1.

Alternate suggestions for the defining formula are:

\`(2 log(sqrt(1+z/2)+root i (1-z/2)))/i\`

Or the much simpler, \`(pi/2)-arcsin z\`

Both equations are mathematically equivalent to the formula shown above.

*Text from [CLTL2](http://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node128.html). Edited for clarity, not content.*

**Examples:**

```lisp
(acos 4) => #C(0.0 2.063437)

(acos pi) => #C(0.0d0 1.8115262724608532d0)

(acos #C(1.0 1.1)) => #C(0.9381622 -1.1168567)
```
