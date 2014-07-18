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
            (:li (:a :href "http://github.com/thephoeron/llthw" :target "_blank" :title "Learn Lisp The Hard Way on GitHub" (:i :class "fa fa-code-fork fa-2x")))
            (:li "Connect with the Author:")
            (:li (:a :href "http://github.com/thephoeron" :target "_blank" :title "The Phoeron on GitHub" (:i :class "fa fa-github-square fa-2x")))
            (:li (:a :href "http://twitter.com/thephoeron" :target "_blank" :title "The Phoeron on Twitter" (:i :class "fa fa-twitter-square fa-2x")))
            (:li (:a :href "http://facebook.com/llthw" :target "_blank" :title "Learn Lisp The Hard Way on Facebook" (:i :class "fa fa-facebook-square fa-2x")))
            (:li (:a :href "https://plus.google.com/111762903517231501866" :target "_blank" :title "The Phoeron on Google+" (:i :class "fa fa-google-plus-square fa-2x")))
            (:li (:a :href "http://cjelupton.wordpress.com" :target "_blank" :title "The Phoeron's developer blog on Wordpress" (:i :class "fa fa-wordpress fa-2x")))
            (:li (:a :href "http://thephoeron.com/" :target "_blank" :title "The Phoeron's Website" (:i :class "fa fa-globe fa-2x")))
            (:li "Donate to this project:")
            (:li (:a :href "/donate/#paypal" :title "Donate by PayPal" (:i :class "fa fa-dollar fa-2x")))
            (:li (:a :href "/donate/#bitcoin" :title "Donate Bitcoin" (:i :class "fa fa-bitcoin fa-2x")))
            (:li (:a :href "/donate/#litecoin" :title "Donate Litecoin" (:span :style "font-size: 30px; font-weight: bold; text-decoration: none;" "&#321;"))))))
      (:div :class "container"
        (:div :class "row"
          (:div :class "col-md-12"
            (str (3bmd:parse-and-print-to-stream "splash-faq.md" hunchentoot::*standard-output* :format :html))))))))

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
  (create-book-pages (directory (merge-pathnames "*.md" *the-book-dir*))))

;; EOF
