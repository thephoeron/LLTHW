#### <em>function</em> <strong>`abort`</strong>

**Syntax:** <strong>`abort`</strong> &optional <em>condition</em> => <em>|</em>

**Description:**

This function transfers control to the restart named `abort`. If no such restart exists, `abort` signals an error of type `control-error`.

If *condition* is `nil` or not supplied, all outstanding restarts are considered. If *condition* is not `nil`, only restarts associated with that condition are considered.

The purpose of the `abort` restart is generally to allow control to return to the innermost "command level."

<strong><em>condition</em></strong> should be an object of type **condition** or **nil**; defaults to **nil**.

*Text from [CLTL2](http://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node344.html)*.
