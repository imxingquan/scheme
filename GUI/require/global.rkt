#lang racket

(provide foo)

(define (foo a b)
  (+ a b))

(define-syntax-rule
  (print-fn fn)
  (begin (printf "~a = ~a\n" 'fn fn)))

(define val 10)