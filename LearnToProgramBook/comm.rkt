#lang racket

(provide printfn)

(define-syntax-rule
  (printfn fn)
  (begin (printf "~a = ~a\n" 'fn fn)))

