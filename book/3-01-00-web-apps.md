
<ol class="breadcrumb">
  <li><a href="/">Home</a></li>
  <li><a href="/book/">Book</a></li>
  <li><a href="/book/3-00-00-overview/">Part Three: Lisp So(u)rcery</a></li>
  <li class="active">Real-World Web Applications</li>
</ol>

## Chapter 3.1

# Real-World Web Applications

> "Free will is a golden thread running through the frozen matrix of fixed events."
> <footer>Robert A. Heinlein, <em>The Rolling Stones</em></footer>

There is no other problem-domain more complicated than the Web.  To be a successful web developer these days, you have to wear a lot of hats---you need to be a programmer, a graphic designer, a system administrator, a DBA, a security expert, you have to know the quirks of every platform and browser, mobile or desktop, you have to keep abreast of the cutting edge.  It's an endless journey, and you'll always find the need to be better than you are.

One of the biggest problems with the Web is just how many languages you need to know to create a straightforward web application.  It's not just HTML, CSS, a splattering of JavaScript, and your choice of PHP, Python, or Perl anymore.  Now you need to learn a web framework, the language it's written in to write the server-side logic, an arbitrary templating language to create your interfaces, and new protocols like Comet or Websockets for real-time two-way communication between the server and client.

Lisp solves all these issues, and will give you an edge over the competition.  You only need to know Lisp, and you can run a web server on any platform, generate your HTML, CSS, JavaScript front-end interfaces, JSON or XML data feeds, and communicate with your clients over AJAX, Comet, REST, or Websockets.  Using a sensible front-end library, you can also ensure a graceful experience for all your users on every platform.  And never have to write a single line of any other language.

---

Extend upon the material covered earlier for building simple web apps; cover the feature and security requirements of web applications, REST endpoints, websockets, etc.

Review web frameworks in Lisp: Weblocks, RESTAS, Clack/Caveman, Anti-Web, REDSHIFTNET; refresher on underlying servers, Hunchentoot, Wookie, IOLib, teepeedee2, etc., database libraries, crane, postmodern, etc., and other web-related libraries, cl-who, cl-css, parenscript, etc.

Web app should be a live-updating feed, pulling from some standard data source in JSON.

Focus on 100% Lisp to generate/parse web languages.

Also, include an exercise that shows how to set up a secure load-balanced cloud lisp web application.

## Exercise 3.1.1

**Full Featured Web Apps**

```lisp

```

## Exercise 3.1.2

**Clack and Caveman**

```lisp

```

## Exercise 3.1.3

**Wookie**

```lisp

```

## Exercise 3.1.4

**CL-ASYNC**

```lisp

```

## Exercise 3.1.5

**IOLib**

```lisp

```

## Exercise 3.1.6

**IOLib**

```lisp

```

## Exercise 3.1.7

**Websockets**

```lisp

```

## Exercise 3.1.8

**Databases and ORMs for the Web**

```lisp

```

## Exercise 3.1.9

**Serializing Data to JSON**

```lisp

```

## Project 3.1.10

**An All-in-One Asynchronous Web Framework**

```lisp

```

## Exercise 3.1.11

**Deploying a Secure, Distributed Lisp Web Application in the Cloud**

```lisp

```

<ul class="pager">
  <li class="previous"><a href="/book/3-00-00-overview/">&laquo; Previous</a></li>
  <li><a href="/book/">Table of Contents</a></li>
  <li class="next"><a href="/book/3-02-00-typesetting/">Next &raquo;</a><li>
</ul>
