;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: scripts.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

(define-easy-handler (llthw-js :uri "/llthw.js") ()
  (setf (content-type*) "text/javascript")
  (ps
    ((@ ($ document) ready)
      (lambda ()
        ((@ ($ "h1") each)
          (lambda ()
            (let* ((the-title ((@ ($ this) text)))
                   (the-id ((@ ((@ the-title to-lower-case)) replace) #\Space "-")))
              ((@ ($ this) attr) "id" the-id)
              ((@ ($ "ul.sidenav") append) (+ "<li><a href='#" the-id "'>" the-title "</a></li>"))
              (return false))))
        (return false)))))

;; EOF
