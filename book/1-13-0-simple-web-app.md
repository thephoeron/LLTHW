<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/1-0-0-overview/">Part One: Grokking Lisp</a></li>
  <li class="active">Extra Credit: A Simple Web Application</li>
</ol>

## Chapter 1.13 --- Extra Credit

# A Simple Web Application

> "Life is short, but the years are long."
> <footer>Robert A. Heinlein, <em>Methuselah's Children</em></footer>

Now that you've gotten a taste for Lisp, how would you like to write a web-app just like the *Learn Lisp The Hard Way* site?  If you already know HTML5, CSS3, JavaScript, and one of the many options available for server-side Web Application programming available these days, such as Ruby on Rails, Python and Django, or PHP, you may be surprised, horrified, and maybe a little pleased to know that you can replace every disparate language of the Web with Common Lisp.  And if you've never done any web development before, you can take a moment to celebrate that learning Lisp lets you program seamlessly everywhere.

I know, that might be a lot to take in all at once, so let's step back and say that again.

You can write a straightforward web application entirely in Common Lisp.  You don't have to write any HTML, CSS, or JavaScript. Lisp can write the markup, styling, and scripting code for you.

You can take what you've learned so far about Macros in Lisp to bundle your template code into convenient Web UI widgets.  Pair this with front-end JavaScript libraries such as Twitter Bootstrap, jQuery UI, or D3, and you have some pretty powerful UI tools with very little code.

And, if you were so inclined, you could even re-write popular front-end JavaScript libraries in Lisp, so that the end-user only has to download the rendered JavaScript code that they need for their browser and the widgets you've included in the current view, instead of the whole library.  Mobile users with limited bandwidth will certainly thank you for the greatly improved browsing experience.

This chapter will contain exercises on:

* Sockets
* Introducing Hunchentoot
* Hunchentoot's Easy-Handler framework
* Serving Static Files
* REGEX Dispatchers
* Intro to Domain-Specific Languages (more in Ch. 1.19)
* Coding HTML5, CSS3, and JavaScript in Lisp
* Parsing Markdown
* Writing a simple web-app with Hunchentoot, CL-WHO, CL-CSS, Parenscript, and 3bmd

<ul class="pager">
  <li class="previous"><a href="/book/1-12-0-namespaces/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/1-14-0-conditionals/">Next &raquo;</a><li>
</ul>
