#### <em>loop-keyword</em> <strong>`across`</strong>

**Syntax:** loop *for var* <strong>`across`</strong> *vector*

**Description:**

This construct binds the variable *var* to the value of each element in the array *vector*.

The loop keyword `across` marks the array *vector*; `across` is used as a preposition in this syntax. Iteration stops when there are no more elements in the specified array that can be referenced.

Some implementations might use a [user-supplied-GLS] `the` special form in the *vector* form to produce more efficient code.

*Text from [CLTL2](http://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node244.html)*.

**Examples:**

```lisp
(loop for char across (the simple-string (find-message port))
      do (write-char char stream))

```
