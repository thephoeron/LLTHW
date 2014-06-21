#### <em>loop-keyword</em> <strong>`above`</strong>

Syntax:

: loop *for var from val1* <strong>`above`</strong> *val2*

Description:

: The loop keyword `above` is analogous to `downto`. This keyword stops iteration just before the value of the variable *var* reaches the value specified by *val2*; the end value of *val2* is not included. Since there is no default for *val1* in decremental stepping, you must supply a value with `above`.

*Text from [CLTL2](http://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node244.html)*.

Examples:

```lisp
;;; Print every third number.

(loop for i from 10 above 1 by 3
      do (print i)) ;Prints 4 lines
10  
7  
4  
1  
=> NIL
```
