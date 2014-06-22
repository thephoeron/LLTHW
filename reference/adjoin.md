### <em>function</em> <strong>`adjoin`</strong>

**Syntax:** <strong>`adjoin`</strong> <em>item list</em> &key test test-not key => <em>set</em>

**Description:**

`adjoin` is used to add an element to a set, provided that it is not already a member. The equality test defaults to `eql`.

```lisp
(adjoin item list) == (if (member item list) list (cons item list))
```

In general, the test may be any predicate; the *item* is added to the list only if there is no element of the list that "satisfies the test."

`adjoin` deviates from the usual rule (see [CLTL2 Chapter 14](http://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node141.html)) for the treatment of arguments named *item* and `:key`. If a `:key` function is specified, it is applied to *item* as well as to each element of the list. The rationale is that if the *item* is not yet in the list, it soon will be, and so the test is more properly viewed as being between two elements rather than between a separate *item* and an element.

```lisp
(adjoin item list :key fn)
  == (if (member (funcall fn item) list)
         list
         (cons (funcall fn item) list))
```

See `pushnew`.

*Text from [CLTL2](http://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node152.html). Edited for clarity, not content.*

**Examples:**

```lisp
(adjoin 1 '(1 2 3)) => (1 2 3)

(adjoin 4 '(1 2 3)) => (4 1 2 3)

```
