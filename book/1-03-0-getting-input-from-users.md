<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Extra Credit: Getting Input From Users</li>
</ol>

## Chapter 1.3 --- Extra Credit

# Getting Input From Users

> "Never worry about theory as long as the machinery does what it's supposed to do."
> <footer>Robert A. Heinlein, <em>Waldo &amp; Magic, Inc.</em></footer>

Often, as a programmer you'll need to handle unpredictable user input. You have no way of knowing what a user might try to enter when you give them a prompt or a form, whether because of unfamiliarity with the system, ignorance of some arbitrary convention, or in the worst case, malicious intent.  Not all programs *need* a way to handle data entry or text commands---but when your program does, it's important to consider in advance how you will validate all user input before it is parsed, read, evaluated, or stored by Lisp---because as a programmer you have made certain assumptions about how your program will be used, and both your users and future-you will thank you for validating input and handling issues in a sensible and interactive way that can be easily understood.

Lisp has some particularly powerful tools for handling all these possibilities.  You can even give your users a complete Lisp REPL that allow them to live-hack your application for customizability---but it could also allow them to easily break everything.  Given a few best practices, however, you can implement a validated, sandboxed shell; prevent SQL injection attacks; and more.

We won't be going over every aspect of this task here, but this Extra Credit chapter should be enough to get you thinking about validating every possible interaction a user might have with your program, to keep it secure and stable.

This Chapter will contain exercises on:

* READ
* EVAL
* Sequences
* Concatenation
* Splitting
* Replacing
* Parsing Numbers
* Custom Prompts

## Exercise 1.3.1

**READ: an introduction to the Lisp Reader**

The `read` procedure can read from a stream

```lisp
* (read)
```

...

Nothing actually happens until you type something else.


```lisp
* (read)
test ;; this is the thing I type when read blocks
TEST

* (read)
12345
12345

* (read)
"A string"
"A string"
```

Since `read` invokes the Lisp reader, any comments you type in its input are ignored. It reads an `s-expression`, not a line. So you can do things like

```lisp
* (read)
"This is a
multiline string"
"This is a
multiline string"

* (read)
(list 1 2
      3 4
	  5 6)
(LIST 1 2 3 4 5 6)
```

As you can see by that call to list, an expression read this way is *not* evaluated. Which is why you can still see the symbol `list` at the front of the List `read` returns.

```lisp
* (read)
(+ 2 3)
(+ 2 3)

* (read)
(defun foo ()
  (+ a b))
(DEFUN FOO () (+ A B))

* (read)
(loop (format t "Fun!~%"))
(LOOP (FORMAT T "Fun!~%"))
```

## Exercise 1.3.2

**EVAL: an introduction to the Lisp Evaluator**

In order to evaluate something you `read`, you need to use `eval`. Some forms are self-evaluating (that is, they return themselves when evaluated).

```lisp
* (eval (read)) ;; NEVER DO THIS IN A REAL PROGRAM
12345
12345

* (eval (read))
"A string"
"A string"
```

Some don't.

```lisp
* (eval (read))
test
  The variable TEST is unbound.
     [Condition of type UNBOUND-VARIABLE]

* (eval (read))
(+ 2 3)
5

* (eval (read))
(defun foo ()
  (+ a b))

; in: DEFUN FOO
;     (+ A B)
; 
; caught WARNING:
;   undefined variable: A
; 
; caught WARNING:
;   undefined variable: B
; 
; compilation unit finished
;   Undefined variables:
;     A B
;   caught 2 WARNING conditions
FOO
```

We're not going to try to *call* that `foo` we just defined because, as you can see by the compilation warnings, we don't have values for `a` and `b` anywhere (and we're not covering dynamic scope until later).

Hopefully you noticed the `NEVER DO THIS...` comment up top. It's because of things like

```lisp
* (eval (read))
(loop (format t "Fun!~%"))
Fun!
Fun!
Fun!
Fun!
Fun!
Fun!
Fun!
Fun!
Fun!
Fun!
Fun!
... ;; FOREVER (until you kill the process with an interrupt)
```

## Exercise 1.3.3

**Sequences**

If you have an existing buffer you want to *destructively* read into, you can use `read-sequence`.

```lisp
* (let ((dest (make-list 5)))
    (read-sequence dest *standard-input*)
	dest)
abcde
(#\a #\b #\c #\d #\e)
```

This procedure won't read more input than can fit into the buffer you specify.

```lisp
* (let ((dest (make-list 3)))
    (read-sequence dest *standard-input*)
	dest)
abcdefghi
(#\a #\b #\c)

* (let ((dest (list)))
    (read-sequence dest *standard-input*)
	dest)
NIL
```

Note that it doesn't even wait for input when given a zero-length buffer. It will also keep reading until the buffer is filled...

```lisp
* (defparameter *buf* (make-list 7))
*BUF*

* (read-sequence *buf* *standard-input*)
one
two
7

* *buf*
(#\o #\n #\e #\Newline #\t #\w #\o)
```

or until some sort of break occurs.

```lisp
* (read-sequence *buf* *standard-input*)
abc
User Interrupt
   [Condition of type SIMPLE-ERROR]

* *buf*
(#\a #\b #\c #\Newline #\t #\w #\o)
```

As you can see from the above examples, the return value of `read-sequence` is the number of stream elements it consumed, and it really is a destructive update on the specified buffer.

The buffer can be of any sequence type, rather than just a list.

```lisp
* (let ((dest (make-string 5)))
    (read-sequence dest *standard-input*)
	dest)
abcdef
"abcde"

* (let ((dest (make-array '(5))))
    (read-sequence dest *standard-input*)
	dest)
abcdef
#(#\a #\b #\c #\d #\e)
```

## Exercise 1.3.4

**More Sequences**

## Exercise 1.3.5

**Sequence Operations**

## Exercise 1.3.6

**Concatenation**

## Exercise 1.3.7

**Splitting**

## Exercise 1.3.8

**Replacing**

## Exercise 1.3.9

**Numbers**

## Exercise 1.3.10

**Input and Output Streams**

## Exercise 1.3.11

**Simple Prompts**

## Exercise 1.3.12

**Custom Prompts**

## Exercise 1.3.13

**Handling Input from Custom Prompts**

<ul class="pager">
  <li class="previous"><a href="/book/1-02-00-input-output/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-04-0-lists/">Next &raquo;</a><li>
</ul>
