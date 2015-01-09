;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: utils.lisp

;;;; Copyright (c) 2012--2015 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

;;; Most of the code in this file is deprecated
;;; Slot for removal

;; Loop over contents of passed FILES list, build pages automatically
(defmacro create-book-pages (files)
  "Loop over contents of passed FILES list, build pages automatically at compile time."
  `(progn
     ,@(loop for file in (eval files)
             collect `(define-easy-handler (,(intern (format nil "~:@(llthw-book-~A~)" (pathname-name file))) :uri ,(format nil "/book/~(~A~)/" (pathname-name file))) ()
                        (llthw-page ()
                          (cl-who:with-html-output (hunchentoot::*standard-output*)
                            (str (3bmd:parse-and-print-to-stream ,(format nil "book/~(~A~)" (file-namestring file)) hunchentoot::*standard-output* :format :html))))))))

(defmacro create-reference-pages (files &key (section "reference"))
  "Loop over contents of passes FILES list, build pages automatically at compile time using REFERENCE-BASIC-PAGE template under folder labelled SECTION."
  `(progn
     ,@(loop for file in (eval files)
             collect `(define-easy-handler (,(intern (format nil "~:@(llthw-~A-~A-page~)" section (pathname-name file))) :uri ,(format nil "~(/~A/~A~)/" section (pathname-name file))) ()
                        (reference-basic-page ()
                          (cl-who:with-html-output (hunchentoot::*standard-output*)
                            (str (3bmd:parse-and-print-to-stream ,(format nil "~(~A/~A~)" section (file-namestring file)) hunchentoot::*standard-output* :format :html))))))))

(defun create-reference-files ()
  (loop for k being the hash-keys in *cl-reference-symbols* using (hash-value v)
        do (with-open-file (s (merge-pathnames (format nil "~(~A~).md" k) *ref-dir*) :direction :output :if-exists :supersede :if-does-not-exist :create)
             (format s "### <em>~(~A~)</em> <strong>`~(~A~)`</strong>~
                        ~%~
                        ~%Syntax:~
                        ~%~
                        ~%<strong>`~(~A~)`</strong> <em>parameters</em> => <em>return-type</em>~
                        ~%~
                        ~%Documentation of parameters and return-results.~
                        ~%~
                        ~%Examples (not from CLHS...):~
                        ~%~
                        ~%```lisp~
                        ~%CL-USER> (example-code 'a 'b 'c)~
                        ~%~
                        ~%'return-result~
                        ~%```~
                        ~%"
                        (getf v :label)
                        (getf v :text)
                        (getf v :text)))))

;; Common Lisp Reference Symbols
;  Symbols labelled with <span class='label'>type</span>
;  - literals (not labelled, emphasized)
;  - wildcard (not labelled, emphasized)
;  - type-specifier (not labelled, emphasized)
;  - method-combination type (not labelled, emphasized)
;  - keyword parameter (not labelled, emphasized)
;  - format control: label-warning
;  - format control parameter: label-default
;  - functions: label-success
;  - generic functions: label-warning
;  - macros: label-danger
;  - reader-macros: label-danger
;  - specials: label-default
;  - variables: label-primary
;  - constants: label-info
(defparameter *cl-reference-symbols* (make-hash-table :test 'equalp :size 1200))

(let ((reflist #.(with-open-file (f (merge-pathnames "reference.lisp-expr" (or *compile-file-pathname* *load-truename*)))
                               (read f))))
  (loop for (key . value) in reflist
        do (setf (gethash key *cl-reference-symbols*) value)))

;; EOF
