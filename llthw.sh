#!/bin/sh

screen -dmS llthw cd ~/quicklisp/local-projects/llthw/ && rlwrap sbcl --load run-llthw.lisp
