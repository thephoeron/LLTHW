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
            (:h4 :class "text-info" "Is this site affiliated with Zed Shaw and Learn Code The Hard Way?")
            (:p "No.  This is a separately run and managed site, based on the format of Zed Shaw's "
              (:a :href "https://gitorious.org/learn-x-the-hard-way/learn-x-the-hard-way" :target "_blank" "LxTHW")
              " open-source package for writing your own programming language course.  You should check out the project and see what others are up to! More information is available at: "
              (:a :href "http://learncodethehardway.org/" :target "_blank" "Learn Code The Hard Way"))
            )))
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
