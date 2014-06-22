#### <em>generic function</em> <strong>`add-method`</strong>

**Syntax:** <strong>`add-method`</strong> <em>(generic-function standard-generic-function) (method method)</em> => <em>modified generic function</em>

**Description:**

The generic function `add-method` adds a method to a generic function. It destructively modifies the generic function and returns the modified generic function as its result.

The *generic-function* argument is a generic function object.

The *method* argument is a method object. The lambda-list of the method function must be congruent with the lambda-list of the generic function, or an error is signaled.

The modified generic function is returned. The result of `add-method` is `eq` to the *generic-function* argument.

If the given method agrees with an existing method of the generic function on parameter specializers and qualifiers, the existing method is replaced.

If the method object is a method object of another generic function, an error is signaled.

*Text from [CLTL2](http://www.cs.cmu.edu/Groups/AI/html/cltl/clm/node311.html). Edited for clarity, not content.*
