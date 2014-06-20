;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: handlers.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

;; Splash page
(define-easy-handler (llthw-splash-page :uri "/") ()
  (basic-llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (:div :class "jumbotron masthead"
        (:div :class "container"
          (:h1 :align "center" "L(λ)THW")
          (:p :class "lead" :align "center"
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
            (:li (:a :href "http://github.com/thephoeron/llthw" :target "_blank" :title "LLTHW on GitHub" (:i :class "fa fa-code-fork fa-2x")))
            (:li "Connect with the Author:")
            (:li (:a :href "http://github.com/thephoeron" :target "_blank" :title "GitHub" (:i :class "fa fa-github-square fa-2x")))
            (:li (:a :href "http://twitter.com/thephoeron" :target "_blank" :title "Twitter" (:i :class "fa fa-twitter-square fa-2x")))
            (:li (:a :href "http://facebook.com/thephoerondotcom" :target "_blank" :title "Facebook" (:i :class "fa fa-facebook-square fa-2x")))
            (:li (:a :href "https://plus.google.com/111762903517231501866" :target "_blank" :title "Google+" (:i :class "fa fa-google-plus-square fa-2x")))
            (:li (:a :href "http://cjelupton.wordpress.com" :target "_blank" :title "Wordpress" (:i :class "fa fa-wordpress fa-2x")))
            (:li (:a :href "http://thephoeron.com/" :target "_blank" :title "Web" (:i :class "fa fa-globe fa-2x")))
            (:li "Donate to this project:")
            (:li (:a :href "/donate/#paypal" :title "Donate by PayPal" (:i :class "fa fa-dollar fa-2x")))
            (:li (:a :href "/donate/#bitcoin" :title "Donate Bitcoin" (:i :class "fa fa-bitcoin fa-2x")))
            (:li (:a :href "/donate/#litecoin" :title "Donate Litecoin" (:span :style "font-size: 30px; font-weight: bold; text-decoration: none;" "&#321;"))))))
      (:div :class "container"
        (:div :class "row"
          (:div :class "col-md-12"
            (:h2 "Frequently Asked Questions")
            (:h4 :class "text-info" "Why would I want to learn Lisp? Isn't it a dead language?")
            (:p "The first Lisp-family language, LISP, is almost 60 years old, but when people talk about Lisp now they are referring specifically to Common Lisp, the ANSI standardized high-level, general purpose, dynamic, multi-paradigm, programmable programming language.  It is far from dead&mdash;it is actively supported in both commercial and open-source implementations, available on nearly every platform (and coming to new ones all the time), has a lively community and a large and actively maintained collection of libraries.")
            (:p "Some of the most exciting projects in the history of computing are being developed in Lisp right now.  In fact, Common Lisp is still the most advanced, robust, expressive, and powerful programming language ever invented, giving it an edge both in everyday programming challenges as well as exploratory programming; and its ANSI standardization gives it a stability that no other language can match, meaning your code is far less susceptible to bit-rot over time.")
            (:h4 :class "text-info" "I've heard Lisp is really hard&mdash;don't you have to be a genius to learn it?")
            (:p "No. Lisp is actually the simplest programming language, and has no syntactic cruft.  While it wasn't designed to be \"easy to learn\" like Swift, Python, Ruby, or Basic, there is less overall to learn and you will be writing real, useful programs in Lisp sooner than you could with other languages.")
            (:h4 :class "text-info" "I've heard Lisp is a functional programming language.  What's that mean?")
            (:p "Functional programming is a style of writing code, a paradigm, based on the lambda calculus, where the programmer aims to eliminate side-effects and reduce software to mathematical purity.  This means that a function can't change state outside of its lexical scope, and that if it is run multiple times with the exact same parameters, it will always return the same result.")
            (:p "Common Lisp is not a strict functional language, though, like Scheme, Racket, or Haskell, it's multi-paradigm like OCaml.  You can choose to use the functional paradigm if you like, but you can also use Procedural, Object-Oriented, Event-Oriented, novel new paradigms like Aspect-Oriented, or mix and match to your hearts content.  Functional programming languages do not offer this flexibility.")
            (:h4 :class "text-info" "Ok, Lisp sounds pretty cool&mdash;but what can I " (:em "do") " with it?")
            (:p "Common Lisp is a powerful, extensible language.  Any application or script, on any platform, can be written in Lisp, usually in less time and with substantially fewer lines of code.  In this course, we will be writing command-line applications, text-based adventure games, web applications, cross-platform desktop software, native apps for mobile devices, 2D and 3D games, and exploring advanced use cases in the industries that favour Lisp over other programming languages&mdash;specifically, enterprise, big data, financial services, natural language processing, robotics, space tech, artificial intelligence, neuroscience, quantum computing, cryptography/security, government and military, exploratory programming, and academic research such as computational physics.")
            (:h4 :class "text-info" "What about other Lisp-family languages, like Scheme or Clojure? Will this course teach me them too?")
            (:p "The focus of this site is entirely on Common Lisp.  While all Lisp-family languages share certain common features, such as the S-Expression syntax, Scheme and Clojure are very different languages than Common Lisp in practice.  That being said, you will be better equipped to learn Scheme or Clojure after learning Common Lisp first, and have a better understanding of when Scheme or Clojure is a better choice for a specific project.")
            (:h4 :class "text-info" "Is this site affiliated with Zed Shaw and Learn Code The Hard Way?")
            (:p "No.  This is a separately run and managed site, based on the format of Zed Shaw's "
              (:a :href "https://gitorious.org/learn-x-the-hard-way/learn-x-the-hard-way" :target "_blank" "LxTHW")
              " open-source package for writing your own programming language course.  You should check out the project and see what others are up to! More information is available at: "
              (:a :href "http://learncodethehardway.org/" :target "_blank" "Learn Code The Hard Way"))
            )))
      )))

;; Try Lisp pages
(define-easy-handler (llthw-try-lisp :uri "/try-lisp/") ()
  (try-lisp-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "try-lisp/index.md" hunchentoot::*standard-output* :format :html)))))

(define-easy-handler (llthw-try-lisp-math :uri "/try-lisp/math/") ()
  (try-lisp-basic-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "try-lisp/math.md" hunchentoot::*standard-output* :format :html)))))

;; Reference pages

(define-easy-handler (llthw-reference :uri "/reference/") (ref-page)
  (let ((the-ref-page (format nil "reference/~(~A~).md" (cl-who:escape-string-all ref-page))))
    (if (probe-file the-ref-page)
        (reference-basic-page ()
          (cl-who:with-html-output (hunchentoot::*standard-output*)
            (str (3bmd:parse-and-print-to-stream the-ref-page hunchentoot::*standard-output* :format :html))))
        ;else
        (reference-basic-page ()
          (cl-who:with-html-output (hunchentoot::*standard-output*)
            (:h4 "Error 404: Not Found"))))))

;; Main site pages
(define-easy-handler (llthw-get-lisp :uri "/get-lisp/") ()
  (llthw-page (:subtitle "Download and Install Steel Bank Common Lisp" :section "get-lisp")
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "resources/get-lisp.md" hunchentoot::*standard-output* :format :html)))))

(define-easy-handler (llthw-resources :uri "/resources/") ()
  (llthw-page (:subtitle "Additional Common Lisp Resources" :section "resources")
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "resources/index.md" hunchentoot::*standard-output* :format :html)))))

(define-easy-handler (llthw-donations :uri "/donate/") ()
  (llthw-page (:subtitle "Support this Project with Your Donations" :section "donations")
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "resources/donations.md" hunchentoot::*standard-output* :format :html)))))

;; Book, Contents at a Glance
;; also available at /book/index/
(define-easy-handler (llthw-book :uri "/book/") ()
  (llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "book/index.md" hunchentoot::*standard-output* :format :html)))))

(eval-when (:execute :compile-toplevel :load-toplevel)
  (create-book-pages *book-files*)
  ;(create-reference-pages *ref-files*)
  ;(create-reference-pages *tl-files* :section "try-lisp")
  )

;; EOF
