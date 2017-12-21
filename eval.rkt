#lang racket/base

(define (prtm-eval e env)
  (cond
    ((eof-object? e) (exit))
    ((null? e) env)
    ((symbol? e) (cadr (assq e env)))
    ((eq? (car e) '$) (cons e env))
    (else
      (prtm-apply (prtm-eval (car e) env)
                  (prtm-eval (cadr e) env)))))

(define (prtm-apply env x)
  (let ((f (car env)))
    (prtm-eval (cddr f)
               (cons (list (cadr f) x) (cdr env)))))

(provide prtm-eval
         prtm-apply)
