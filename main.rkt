#lang racket/base

(require "eval.rkt")

(define VERSION "v0.1.0")

(define (prtm-repl)
  (display "氕> ")
  (displayln (prtm-eval (read) '()))
  (prtm-repl))

(displayln (string-append "Protium " VERSION))

(prtm-repl)
