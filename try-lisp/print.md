### Strings and Printing

You can print any string using the `print` function.  In the REPL, this string is also returned, so it has the effect of printing it twice---once to `*standard-output*` as instructed by the `print` function, and once as the printed representation of the function's return value for the REPL interface.

`(print "Hello, world!")`

`(print "This is a string")`

The `format` function is a little more flexible; you can choose whether to have it return a value, print it and return only `nil`, or send it to any other stream.

`(format nil "Hello, ~A!~%" 'lisp)`

`(format t "Hello, ~A!~%" 'lisp)`

It takes a *format string* which includes directives, the tilde character followed by a character.  As you can see, some directives consume arguments (like the `~A` above), others don't.

<p class="text-right">
  <a class="btn btn-primary" id="try-lisp-next" href="/try-lisp/end/">Next &raquo;</a>
</p>
