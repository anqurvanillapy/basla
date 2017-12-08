;; REPL.

(load "untyped.scm")

(define (main-repl env lib)
  (display "basla> ")
  (ignore-errors
    (lambda () (display (car (ulc/eval (read) env lib)))))
  (newline)
  (main-repl env lib))

(main-repl '() (ulc/include-lib))
