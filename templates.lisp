;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: templates.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

(defmacro basic-llthw-page ((&key (title "L(λ)THW")) &body body)
  `(cl-who:with-html-output-to-string (hunchentoot::*standard-output* nil :prologue t :indent t)
    (:html :lang "en"
      (:head
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css")
        (:link :rel "stylesheet" :href "/static/css/llthw.css")
        (:style :type "text/css" (str colorize:*coloring-css*))
        (:title ,title))
      (:body
        (:nav :class "navbar navbar-inverse navbar-static-top" :role "navigation"
          (:div :class "container-fluid"
            (:div :class "navbar-header"
              (:a :class "navbar-brand" :href "#" (str (format nil "L(~C)THW" #\greek_small_letter_lamda))))
            (:ul :class "nav navbar-nav"
              (:li :class "active" (:a :href "/" "Home"))
              (:li (:a :href "/book/" "Book"))
              (:li (:a :href "/resources/" "Resources")))))
        ,@body
        (:script :src "/static/js/jquery.js" :type "text/javascript")
        (:script :src "//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js")))))

(defmacro llthw-page ((&key (title "L(λ)THW")) &body body)
  `(cl-who:with-html-output-to-string (hunchentoot::*standard-output* nil :prologue t :indent t)
    (:html :lang "en"
      (:head
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css")
        (:link :rel "stylesheet" :href "//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css")
        (:link :rel "stylesheet" :href "/static/css/llthw.css")
        (:style :type "text/css" (str colorize:*coloring-css*))
        (:title ,title))
      (:body
        (:nav :class "navbar navbar-inverse navbar-static-top" :role "navigation"
          (:div :class "container-fluid"
            (:div :class "navbar-header"
              (:a :class "navbar-brand" :href "#" (str (format nil "L(~C)THW" #\greek_small_letter_lamda))))
            (:ul :class "nav navbar-nav"
              (:li (:a :href "/" "Home"))
              (:li :class "active"
                (:a :href "/book/" "Book"))
              (:li (:a :href "/resources/" "Resources")))))
        (:div :class "container-fluid"
          (:div :class "row"
            (:div :class "col-md-2")
            (:div :class "col-md-6"
              ,@body)
            (:div :class "col-md-4"
              (:div :id "console" :data-spy "affix" :data-offset-top "60" :class "affix"))))
        (:script :src "/static/js/jquery.js" :type "text/javascript")
        (:script :src "//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js")
        (:script :src "/static/js/jscl.js" :type "text/javascript")
        (:script :src "/static/js/jqconsole.min.js" :type "text/javascript")
        (:script :src "/static/js/llthw.js" :type "text/javascript")))))

;; EOF
