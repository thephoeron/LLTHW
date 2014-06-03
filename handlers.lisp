;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: handlers.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

(define-easy-handler (llthw-splash-page :uri "/") ()
  (basic-llthw-page ()
    (cl-who:with-html-output (hunchentoot::*standard-output*)
      (:div :class "jumbotron"
        (:div :class "container"
          (:h1 :align "center" "L(λ)THW")
          (:h3 :align "center"
            "Learn Lisp The Hard Way")
          (:h4 :align "center"
            "\"the Phoeron\" Colin J.E. Lupton")))
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
