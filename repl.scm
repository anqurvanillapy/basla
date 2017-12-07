;; REPL.

(load "untyped.scm")

(define (ulc/load-lib)
  (for-each (lambda (filename)
              (ulc/eval (read (open-input-file filename)) '()))
            (directory-read "*.ulc.basla")))

(define (main-repl)
  (let ()
    (display "basla> ")
    ;; TODO: STLC eval.
    (display (ulc/eval (read) '()))
    (newline)
    (main-repl)))

(ulc/load-lib)

(main-repl)
