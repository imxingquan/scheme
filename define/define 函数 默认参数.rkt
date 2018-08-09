#lang racket
(define (func arg [arg2 #t] [arg3 #f])
  (printf "~a ~a ~a" arg arg2 arg3))

(func 1)