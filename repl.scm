;; REPL.

(load "untyped.scm")

(define (read-all)
  (define (collect result)
    (let ((obj (read)))
      (if (eof-object? obj)
           result
           (collect (cons obj result)))))
  (collect '()))

(define (ulc/include-lib)
  (append-map (lambda (f)
                (with-input-from-file f read-all))
              (directory-read "*.basla")))

(define (main-repl env)
  (display "basla> ")
  (display (ulc/eval (read) env))
  (newline)
  (main-repl env))

(main-repl (ulc/include-lib))
