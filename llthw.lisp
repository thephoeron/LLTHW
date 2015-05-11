;;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: LLTHW; Base: 10 -*-
;;;; file: llthw.lisp

;;;; Copyright (c) 2012--2015, "the Phoeron" Colin J.E. Lupton <//thephoeron.com>
;;;; See LICENSE for additional information.

(in-package :llthw)

(defun llthw-start (&key (port 8080))
  "Start LLTHW server."
  (when (null *acc*)
    (setf *acc* 
          (make-instance 'hunchentoot:easy-acceptor 
                         :port port
                         :access-log-destination *acc-log*
                         :message-log-destination *msg-log*)))
  (hunchentoot:start *acc*))

(defun llthw-stop ()
  "Stop LLTHW server."
  (when *acc*
    (hunchentoot:stop *acc*))
  (setf *acc* nil))

;; Assumes SBCL + Quicklisp

(defun llthw-restart (&key (port 8080))
  "Stop, reload/recompile, and start the LLTHW server again."
  (llthw-stop)
  (ql:quickload "llthw")
  (sb-ext:gc :full t)
  (llthw-start :port port))

;; EOF
