;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: llthw.lisp

;;;; Copyright (c) 2012--2014 "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

(defun llthw-start (&key (port 8080))
  (when (null *acc*)
    (setf *acc* (make-instance 'hunchentoot:easy-acceptor :port port)))
  (hunchentoot:start *acc*))

(defun llthw-stop ()
  (when *acc*
    (hunchentoot:stop *acc*))
  (setf *acc* nil))

(defun llthw-restart ()
  (llthw-stop)
  (ql:quickload "llthw")
  (llthw-start))

;; EOF
