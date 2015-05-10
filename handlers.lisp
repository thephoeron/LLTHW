;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: handlers.lisp

;;;; Copyright (c) 2012--2015 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
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
          (:p :align "center" :style "color: silver;"
              "Brought to you by the Toronto Lisp User Group")
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
            (:li "Contribute:")
            (:li (:a :href "http://github.com/LispTO/llthw" :target "_blank" :title "Learn Lisp The Hard Way on GitHub" (:i :class "fa fa-code-fork fa-2x")))
            (:li "Connect with the Authors:")
            (:li (:a :href "http://github.com/LispTO" :target "_blank" :title "Toronto Lisp User Group on GitHub" (:i :class "fa fa-github-square fa-2x")))
            (:li (:a :href "http://facebook.com/llthw" :target "_blank" :title "Learn Lisp The Hard Way on Facebook" (:i :class "fa fa-facebook-square fa-2x")))
            (:li (:a :href "http://lisptoronto.org/" :target "_blank" :title "Toronto Lisp User Group website" (:i :class "fa fa-globe fa-2x")))
            (:li "Support this project:")
            (:li (:a :href "https://www.digitalocean.com/?refcode=ef3cf1ffcbb7" :title "Get Cloud Hosting on Digital Ocean" (:i :class "fa fa-cloud fa-2x")))
            (:li (:a :href "/donate/#paypal" :title "Donate by PayPal" (:i :class "fa fa-paypal fa-2x")))
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

;; Handle book pages by reference
;; - this function could use some refactoring and clean-up

(defun llthw-book-page ()
  "Probe for the book-page file from the current request script name."
  (let* ((script-name (hunchentoot:script-name*))
         (script-list (split-sequence #\/ script-name :remove-empty-subseqs t)))
    (if (= (length script-list) 2)
        (let* ((file-name (format nil "~{~(~A~)~^/~}.md" script-list)))
          (if (probe-file file-name)
              (llthw-page ()
                          (cl-who:with-html-output (hunchentoot::*standard-output*)
                            (str (3bmd:parse-and-print-to-stream file-name
                                                                 hunchentoot::*standard-output*
                                                                 :format :html))))
              (progn
                (setf (return-code*) +http-not-found+)
                (abort-request-handler))))
        (progn
          (setf (return-code*) +http-forbidden+)
          (abort-request-handler)))))

;; Regex dispatcher for book pages

(push (hunchentoot:create-regex-dispatcher "^/book/[\\w-]+/$" 'llthw-book-page)
      hunchentoot:*dispatch-table*)

;; robots.txt file

(define-easy-handler (robots-txt :uri "/robots.txt") ()
  (setf (content-type*) "text/plain")
  (format nil "User-agent: *~%Disallow: /static/~%Disallow: /reference/"))

;; EOF
