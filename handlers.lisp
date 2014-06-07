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
            (:li (:a :href "http://github.com/thephoeron/llthw" :target "_blank" :title "LLTHW on GitHub" (:i :class "fa fa-code-fork fa-2x")))
            (:li "Connect with the Author:")
            (:li (:a :href "http://github.com/thephoeron" :target "_blank" :title "GitHub" (:i :class "fa fa-github-square fa-2x")))
            (:li (:a :href "http://twitter.com/thephoeron" :target "_blank" :title "Twitter" (:i :class "fa fa-twitter-square fa-2x")))
            (:li (:a :href "http://facebook.com/thephoerondotcom" :target "_blank" :title "Facebook" (:i :class "fa fa-facebook-square fa-2x")))
            (:li (:a :href "https://plus.google.com/111762903517231501866" :target "_blank" :title "Google+" (:i :class "fa fa-google-plus-square fa-2x")))
            (:li (:a :href "http://cjelupton.wordpress.com" :target "_blank" :title "Wordpress" (:i :class "fa fa-wordpress fa-2x")))
            (:li (:a :href "http://thephoeron.com/" :target "_blank" :title "Web" (:i :class "fa fa-globe fa-2x")))
            (:li "Donate to this project:")
            (:li (:a :href "bitcoin:17nWsM2aKqKewm7zDzv3mGUyqzKZKjsJGQ" :title "Donate Bitcoin" (:i :class "fa fa-bitcoin fa-2x")))
            (:li (:a :href "litecoin:LZfkNpcQetVcNNbpERQoCvRJkVERYry9Me" :title "Donate Litecoin" (:span :style "font-size: 30px; font-weight: bold; text-decoration: none;" "&#321;"))))))
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
            (:h4 :class "text-info" "What about other Lisp-family languages, like Scheme or Clojure? Will this course teach me them too?")
            (:p "The focus of this site is entirely on Common Lisp.  While all Lisp-family languages share certain common features, such as the S-Expression syntax, Scheme and Clojure are very different languages than Common Lisp in practice.  That being said, you will be better equipped to learn Scheme or Clojure after learning Common Lisp first, and have a better understanding of when Scheme or Clojure is a better choice for a specific project.")
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

;; Book, Contents at a Glance
;; also available at /book/index/
(define-easy-handler (llthw-book-index :uri "/book/") ()
  (llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (str (3bmd:parse-and-print-to-stream "book/index.md" hunchentoot::*standard-output* :format :html)))))

;; Loop over contents of book/ subdirectory, build pages automatically
(defmacro create-book-pages ()
  "Loop over contents of book/ subdirectory, build pages automatically at compile time."
  `(progn
     ,@(loop for file in *book-files*
             collect `(define-easy-handler (,(intern (format nil "~(llthw-book~A~)" (pathname-name file))) :uri ,(format nil "/book/~(~A~)/" (pathname-name file))) ()
                        (llthw-page ()
                          (cl-who:with-html-output (hunchentoot::*standard-output*)
                            (str (3bmd:parse-and-print-to-stream ,(format nil "book/~(~A~)" (file-namestring file)) hunchentoot::*standard-output* :format :html))))))))

(create-book-pages)

;; EOF
