;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: packages.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :cl-user)

(defpackage #:llthw
    (:use :cl
          :cl-who
          :cl-css
          :3bmd
          :hunchentoot)
    (:export #:*llthw-version*))

;; see asdf system definition
(defvar llthw:*llthw-version*
  #.llthw-asd::*llthw-version*)

;; EOF
