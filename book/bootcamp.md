# LLTHW

### Common Lisp Bootcamp



#### The REPL

The Lisp REPL is a READ-EVAL-PRINT Loop.  In other words, it reads user input, evaluates it, prints the return results, and then waits for more user input.  It is typically marked by a prompt, much like the command line for your operating system.  You can consider it as the main interface to the Lisp language.

Depending on the implementation of Lisp you are using, you may see different prompts.  You can also customize your prompt, if you like.

Typically, imagining that the underscore character below is your blinking cursor, you'll see something to the effect of:

```lisp
CL-USER> _
```

But in SBCL, the default prompt is much less informative:

```lisp
* _
```

For convenience sake, when you should enter a piece of code in the REPL for immediate evaluation, each line of code will be marked by the SBCL prompt character.  When you should enter all the code given in a file, there will be no prompt character preceding each line, and you will be provided with a file name to enter it in.

Remember, you don't type in the prompt character `*` at the REPL; even if your prompt looks different, the `*` symbolizes all Common Lisp REPLs.

#### Prefix Notation

In Lisp, function-names and special operators come first in an expression, followed by their parameters.  This notation, called "Polish Prefix Notation", can take some getting used to, but once you get the hang of it, it actually makes a lot more sense.

For example, say you want to add together a list of numbers.  Normally, you would think to write this: `1 + 2 + 3 + 4 + 5 = 15`, but in Lisp you would write:

```lisp
* (+ 1 2 3 4 5)
```

And this expression would 'return' the integer `15`, which is typically written as `=> 15`.

In Lisp, you don't have to write the addition operator, `+`, over and over between each number you wish to add together.  You are passing parameters to a function, and the function knows to collect the parameters as a set and Sum them.

