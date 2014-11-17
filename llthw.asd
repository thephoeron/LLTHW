;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: llthw.asd

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :cl-user)

(defpackage llthw-asd
    (:use :cl :asdf)
    (:export #:*llthw-version*))

(in-package :llthw-asd)

(defparameter *llthw-version* "0.2.1")

(defsystem llthw
    :version #.*llthw-version*
    :author "\"the Phoeron\" Colin J.E. Lupton <sysop@thephoeron.com>"
    :license "MIT"
    :description "LLTHW"
    :serial t
    :depends-on (:hunchentoot
                 :cl-who
                 :cl-css
                 :parenscript
                 :split-sequence
                 :3bmd
                 :3bmd-ext-code-blocks
                 :3bmd-ext-definition-lists
                 :3bmd-ext-tables)
    :components ((:file "packages")
                 (:file "config")
                 (:file "utils")
                 (:file "styles")
                 (:file "scripts")
                 (:file "templates")
                 (:file "handlers")
                 (:file "llthw")))

;; EOF
