#lang racket/base

(require rackunit
         "eval.rkt")

(define-values (in out)
               (make-pipe))

(check-equal? '(($ x . x))
              (prtm-eval '($ x . x) '())
              "Simple lambda term")
