;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: scripts.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

(define-easy-handler (llthw-js :uri "/llthw.js") ()
  (setf (content-type*) "text/javascript")
  (ps
    ((@ j-query ajax-setup) (create cache true))
    ((@ ($ document) ready)
      (lambda ()
        ((@ ($ "#try-lisp-next") click)
          (lambda ()
            (let ((the-href ((@ ($ this) attr) "href")))
              ((@ ($ "#trylispbody") load) the-href)
                (return false))))
        ((@ ($ "#reference-search") select2) (create placeholder "Search Common Lisp Symbol Reference..."
                                                     allow-clear true
                                                     format-result (lambda (obj)
                                                                     (let* ((item (@ obj element))
                                                                            (label ((@ ($ item) data) "label")))
                                                                       (return (+ "<strong>" (@ obj text) "</strong> <span class='label label-default'>" label "</span>"))
                                                                       ))
                                                     escape-markup (lambda (m) (return m))))
        ((@ ($ "#reference-search") change)
          (lambda ()
            (let* ((the-id ((@ ($ "#reference-search") select2) "val"))
                   (the-label (@ ((@ ($ "#reference-search") select2) "data") text))
                   (the-href (+ "/reference/?ref-page=" the-id ""))
                   (clhs-root "http://www.lispworks.com/reference/HyperSpec/")
                   (clhs-entry ((@ ($ "#reference-search option:selected") data) "clhs")))
              ((@ ($ "#refSearchModalLabel") text) (+ "Common Lisp Symbol: " the-label " "))
              ((@ ($ "#refSearchModalCLHSLink") attr) "href" (+ clhs-root clhs-entry))
              ((@ ($ "#refSearchModalBody") html) "<div style='width: 100%; height: 240px; min-height: 240px; display: block; position: static; vertical-align: middle;'><div style='margin-top: auto; text-align: center;'><h4 class='text-info'>Loading...</h4><i class='fa fa-spinner fa-spin fa-4x text-info' style='margin: auto;'></i></div></div>")
              ((@ ($ "#refSearchModal") modal) "show")
              ((@ ($ "#refSearchModalBody") load) the-href)
              (return false))))
        (return false)))
    ((@ ($ "#llthwdoc img") add-class) "img-thumbnail")
    ((@ ($ "ul.sidenav") html) "")
    ((@ ((@ ((@ ($ "#llthwdoc") children)) filter) ":header") each)
      (lambda ()
        (let* ((the-title ((@ ($ this) text)))
               (the-id ((@ ((@ the-title to-lower-case)) replace) (regex "/[^A-Za-z0-9]+/g") "-")))
          ((@ ($ this) attr) "id" the-id)
          ((@ ($ "ul.sidenav") append) (+ "<li><a href='#" the-id "'>" the-title "</a></li>"))
          (return true))))
      ((@ ($ "ul.sidenav") append) "<li><a href='#top'><i class='fa fa-angle-up'></i> Back to Top</a></li>")))

;; Google Analytics

(defun google-analytics ()
  (cl-who:with-html-output (hunchentoot::*standard-output*)
    (:script
      "
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-51817003-1', 'learnlispthehardway.org');
  ga('require', 'displayfeatures');
  ga('send', 'pageview');

")))

;; EOF
