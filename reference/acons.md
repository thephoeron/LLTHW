#### <em>function</em> <strong>`acons`</strong>

**Syntax:** <strong>`acons`</strong> <em>key datum a-list</em> => <em>a-list</em>

**Description:**

`acons` constructs a new association list by adding the pair *(key . datum)* to the head of the old *a-list*.

```lisp
(acons x y a) == (cons (cons x y) a)
```

*Text from [CLTL2](http://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node153.html)*.

**Examples:**

```lisp
(let ((a-list (list (cons 'a 'b))))
  (acons 'c 'd a-list))

=> ((C . D) (A . B))

```
