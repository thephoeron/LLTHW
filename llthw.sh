#!/bin/sh
cd ~/quicklisp/local-projects/llthw/
screen -dmS llthw rlwrap sbcl --load run-llthw.lisp
