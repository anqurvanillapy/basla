;; Untyped lambda calculus.

(define (ulc/eval e env lib)
  (cond
    ((null? e) env)
    ((symbol? e) (cadr (assq e env)))
    ((eq? (car e) '$) (cons e env))
    ((symbol? (car e))
     (ulc/apply (ulc/eval (cadr (assq (car e) lib)) env lib)
                (ulc/eval (cadr e) env lib)
                lib))
    (else (ulc/apply (ulc/eval (car e) env lib)
                     (ulc/eval (cadr e) env lib)
                     lib))))

(define (ulc/apply f x lib)
  (ulc/eval (cddr (car f))
            (cons (list (cadr (car f)) x) (cdr f))
            lib))

(define (ulc/preproc e)
  (cond
    ((eq? (car e) 'def) (cdr e))
    (else e)))

(define (ulc/read-all)
  (define (collect result)
    (let ((obj (read)))
      (if (eof-object? obj)
           result
           (collect (cons (ulc/preproc obj) result)))))
  (collect '()))

(define (ulc/include-lib)
  (append-map (lambda (f)
                (with-input-from-file f ulc/read-all))
              (directory-read "*.basla")))
