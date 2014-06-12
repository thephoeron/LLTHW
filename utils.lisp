;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: utils.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

;; Loop over contents of book/ subdirectory, build pages automatically
(defmacro create-book-pages (files)
  "Loop over contents of 'book/' subdirectory, build pages automatically at compile time."
  `(progn
     ,@(loop for file in (eval files)
             collect `(define-easy-handler (,(intern (format nil "~:@(llthw-book-~A~)" (pathname-name file))) :uri ,(format nil "/book/~(~A~)/" (pathname-name file))) ()
                        (llthw-page ()
                          (cl-who:with-html-output (hunchentoot::*standard-output*)
                            (str (3bmd:parse-and-print-to-stream ,(format nil "book/~(~A~)" (file-namestring file)) hunchentoot::*standard-output* :format :html))))))))

;; EOF
