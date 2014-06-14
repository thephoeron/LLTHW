(ql:quickload "llthw")

(llthw::llthw-start :port 8080)

(if llthw::*acc*
  (format t "~%;; LLTHW running on ~A" llthw::*acc*)
  (format t "~%;; ERROR: LLTHW failed to start."))
