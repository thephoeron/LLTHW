;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: scripts.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

(define-easy-handler (llthw-js :uri "/llthw.js") ()
  (setf (content-type*) "text/javascript")
  (ps
    ((@ ($ ".trylisphead#overview a") click)
      (lambda ()
        ((@ ($ "#trylispbody") load) ((@ ($ this) attr) href))
        (return false)))
    ((@ ($ "#llthwdoc img") add-class) "img-thumbnail")
    ((@ ((@ ((@ ($ "#llthwdoc") children)) filter) ":header") each)
      (lambda ()
        (let* ((the-title ((@ ($ this) text)))
               (the-id ((@ ((@ the-title to-lower-case)) replace) (regex "/[\,\.\!\@\#\$\%\^\&\*\(\)\?\/\\ ]/g") "-")))
          ((@ ($ this) attr) "id" the-id)
          ((@ ($ "ul.sidenav") append) (+ "<li><a href='#" the-id "'>" the-title "</a></li>"))
          (return true))))
      ((@ ($ "ul.sidenav") append) "<li><a href='#top'><i class='fa fa-angle-up'></i> Back to Top</a></li>")))

;; Google Analytics

(defun google-analytics ()
  (cl-who:with-html-output (hunchentoot::*standard-output*)
    (:script
      "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-51817003-1', 'learnlispthehardway.org');
      ga('send', 'pageview');")))

;; EOF
