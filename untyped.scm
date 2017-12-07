;; Untyped lambda calculus.

(define (ulc/eval e env)
  (cond
    ((symbol? e) (cadr (assq e env)))
    ((eq? (car e) '$) (cons e env))
    (else (ulc/apply (ulc/eval (car e) env)
                     (ulc/eval (cadr e) env)))))

(define (ulc/apply f x)
  (ulc/eval (cddr (car f))
            (cons (list (cadr (car f)) x) (cdr f))))
