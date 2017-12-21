#lang racket

(define (ulc/eval e env)
  (cond
    ((null? e) env)
    ((symbol? e) (cadr (assq e env)))
    ((eq? (car e) '$) (cons e env))
    (else
      (ulc/apply (ulc/eval (car e) env)
                 (ulc/eval (cadr e) env)))))

(define (ulc/apply env x)
  (let ((f (car env)))
    (ulc/eval (cddr f)
              (cons (list (cadr f) x) (cdr env)))))

(define (ulc/repl)
  (display "氕> ")
  (display (ulc/eval (read) '()))
  (newline)
  (ulc/repl))

(ulc/repl)
