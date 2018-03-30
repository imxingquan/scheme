#lang racket
(define-syntax-rule
(print f)
(begin (t 'f) f))
(define (t f) (display `,f))

 (print (number? 0))
(print (+ 1 1 1))

(define-syntax-rule
  (print2 fn)
  (begin (s 'fn fn)))

(define (s arg1 arg2)
  (printf "~a=~a\n" arg1 arg2))

(print2 (+ 1 1 1))

(define-syntax-rule
  (print3 fn)
  (begin (printf "~a = ~a\n" 'fn fn)))

(print3 (+ 3 2 1))