;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: handlers.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

(define-easy-handler (llthw-splash-page :uri "/") ()
  (basic-llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (:div :class "jumbotron masthead"
        (:div :class "container"
          (:h1 :align "center" "L(λ)THW")
          (:p :align "center"
            "Learn Lisp The Hard Way")
          (:div :class "row"
            (:div :class "col-md-8 col-md-offset-2"
              (str (3bmd:parse-and-print-to-stream "splash-example.md" hunchentoot::*standard-output* :format :html))))
          (:p :align "center"
            (:a :href "/book/" :class "btn btn-info btn-lg"
              (:span :class "glyphicon glyphicon-book")
              " Read the HTML Ebook") " "
            (:a :href "/get-lisp/" :class "btn btn-primary btn-lg" :alt "Download Common Lisp" :title "Download Common Lisp"
              (:span :class "glyphicon glyphicon-cloud-download")
              " Download Common Lisp") " "
            (:a :href "/try-lisp/" :class "btn btn-primary btn-lg"
              (:span :class "glyphicon glyphicon-road")
              " Try Lisp Now in Your Browser"))
          (:ul :class "masthead-links" :align "center"
            (:li (:a :href "#" :class "btn btn-default" :disabled "disabled" "Paperback Edition (Coming Soon)"))
            (:li (:a :href "/book/" :class "btn btn-default" "Free Online HTML Ebook"))
            (:li (:a :href "/resources/" :class "btn btn-default" "Additional Lisp Language Resources")
            (:li (:a :href "#" :class "btn btn-default" :disabled "disabled" (fmt "Draft Version ~A (alpha)" *llthw-version*)))))))
      (:div :class "social-banner"
        (:div :class "container"
          (:ul :class "social-banner-buttons"
            (:li "Source Code:")
            (:li (:a :href "http://github.com/thephoeron/llthw" :target "_blank" "github.com/thephoeron/llthw"))
            (:li "Connect with the Author:")
            (:li (:a :href "http://github.com/thephoeron" :target "_blank" "GitHub"))
            (:li (:a :href "http://twitter.com/thephoeron" :target "_blank" "Twitter"))
            (:li (:a :href "http://facebook.com/thephoerondotcom" :target "_blank" "Facebook"))
            (:li (:a :href "https://plus.google.com/111762903517231501866" :target "_blank" "Google+"))
            (:li (:a :href "http://cjelupton.wordpress.com" :target "_blank" "Wordpress"))
            ;(:li (:a :href "http://thephoeron.com/" :target "_blank" "Web"))
            (:li "Donate to this project:")
            (:li (:a :href "bitcoin:17nWsM2aKqKewm7zDzv3mGUyqzKZKjsJGQ" "Bitcoin"))
            (:li (:a :href "litecoin:LZfkNpcQetVcNNbpERQoCvRJkVERYry9Me" "Litecoin")))))
      (:div :class "container"
        (:div :class "row"
          (:div :class "col-md-12"
            (:h2 "Frequently Asked Questions")
            (:h4 :class "text-info" "Why Lisp? Isn't it " (:em "ancient") "?")
            (:p "The first Lisp-family language, LISP, is almost 60 years old, but when people talk about Lisp now they are referring specifically to Common Lisp, the ANSI standardized high-level, general purpose, dynamic, multi-paradigm, programmable programming language.")
            (:p "In fact, Common Lisp is still the most advanced, robust, expressive, and powerful programming language ever invented; and its ANSI standardization gives it a stability that no other language can match, meaning your code is far less susceptible to bit-rot over time.  There is a wide selection of both commercial and open-source implementations to choose from, based on your needs or the needs of your organization.  And, there is also a large and actively maintained collection of libraries for Common Lisp, available through the Quicklisp package manager, that extend the language to support any project you have in mind.")
            (:h4 :class "text-info" "I've heard Lisp is really hard&mdash;don't you have to be a genius to learn it?")
            (:p "No. Lisp is actually the simplest programming language, and has no syntactic cruft.  While it wasn't designed to be \"easy to learn\" like Swift, Python, Ruby, or Basic, there is less overall to learn and you will be writing real, useful programs in Lisp sooner than you could with other languages.")
            (:h4 :class "text-info" "I've heard Lisp is a functional programming language.  What's that mean?")
            (:p "Functional programming is a style of writing code, a paradigm, based on the lambda calculus, where the programmer aims to eliminate side-effects and reduce software to mathematical purity.  This means that a function can't change state outside of its lexical scope, and that if it is run multiple times with the exact same parameters, it will always return the same result.")
            (:p "Common Lisp is not strictly functional, though, like Scheme, Racket, or Haskell, it's multi-paradigm like OCaml.  You can choose to use the functional paradigm if you like, but you can also use Procedural, Object-Oriented, Event-Oriented, novel new paradigms like Aspect-Oriented, or mix and match to your hearts content.")
            (:h4 :class "text-info" "Ok, Lisp sounds pretty cool&mdash;but what can I " (:em "do") " with it?")
            (:p "Common Lisp is a powerful, extensible language.  Any application or script, on any platform, can be written in Lisp, usually in less time and with substantially fewer lines of code.  In this course, we will be writing command-line applications, text-based adventure games, web applications, cross-platform desktop software, native apps for mobile devices, 2D and 3D games, and exploring advanced use cases in the industries that favour Lisp over other programming languages&mdash;specifically, enterprise, big data, financial services, natural language processing, robotics, space tech, artificial intelligence, neuroscience, quantum computing, cryptography/security, government and military, exploratory programming, and academic research such as computational physics.")
            (:h4 :class "text-info" "Is this site affiliated with Zed Shaw and Learn Code The Hard Way?")
            (:p "No.  This is a separately run and managed site, based on the format of Zed Shaw's "
              (:a :href "https://gitorious.org/learn-x-the-hard-way/learn-x-the-hard-way" :target "_blank" "LxTHW")
              " open-source package for writing your own programming language course.  You should check out the project and see what others are up to! More information is available at: "
              (:a :href "http://learncodethehardway.org/" :target "_blank" "Learn Code The Hard Way"))
            )))
      )))

(define-easy-handler (llthw-try-lisp :uri "/try-lisp/") ()
  (basic-llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      )))

(define-easy-handler (llthw-get-lisp :uri "/get-lisp/") ()
  (basic-llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      )))

(define-easy-handler (llthw-resources :uri "/resources/") ()
  (basic-llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      )))

(define-easy-handler (llthw-book-index :uri "/book/") ()
  (llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "book/index.md" hunchentoot::*standard-output* :format :html)))))

(define-easy-handler (llthw-book-preface :uri "/book/preface/") ()
  (llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "book/preface.md" hunchentoot::*standard-output* :format :html)))))

(define-easy-handler (llthw-book-intro :uri "/book/introduction/") ()
  (llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "book/introduction.md" hunchentoot::*standard-output* :format :html)))))

(define-easy-handler (llthw-book-bootcamp :uri "/book/bootcamp/") ()
  (llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "book/bootcamp.md" hunchentoot::*standard-output* :format :html)))))

(define-easy-handler (llthw-book-styleguide :uri "/book/style-guide/") ()
  (llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "book/style-guide.md" hunchentoot::*standard-output* :format :html)))))

(define-easy-handler (llthw-book-configuration :uri "/book/configuration/") ()
  (llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "book/configuration.md" hunchentoot::*standard-output* :format :html)))))

(define-easy-handler (llthw-book-1-1-0-syntax-overview :uri "/book/1-1-0-syntax-overview/") ()
  (llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "book/1-1-0-syntax-overview.md" hunchentoot::*standard-output* :format :html)))))

(define-easy-handler (llthw-book-1-2-0-input-output :uri "/book/1-2-0-input-output/") ()
  (llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "book/1-2-0-input-output.md" hunchentoot::*standard-output* :format :html)))))

;; EOF
