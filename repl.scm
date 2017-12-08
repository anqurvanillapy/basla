;; REPL.

(load "untyped.scm")

(define (main-repl env lib)
  (display "basla> ")
  (ignore-errors
    (lambda ()
      (let ((result (car (ulc/eval (read) env lib))))
        (display "=> ")
        (display result))))
  (newline)
  (main-repl env lib))

(main-repl '() (ulc/include-lib))
