### <em>function</em> <strong>`acosh`</strong>

**Syntax:** <strong>`acosh`</strong> <em>number</em> => <em>number</em>

**Description:**

`acosh` computes the hyperbolic arc cosine function, which is mathematically defined for an argument *z* as follows:

\`log(z+(z+1) sqrt((z-1)/(z+1)))\`

The result of `acosh` may be complex even if the argument is not complex; this occurs when the argument is less than 1.

*Text from [CLTL2](http://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node128.html). Edited for clarity, not content.*

**Examples:**

```lisp
(acosh 1.0) => 0.0

(acosh 0.9) => #C(0.0 0.45102686)
```
