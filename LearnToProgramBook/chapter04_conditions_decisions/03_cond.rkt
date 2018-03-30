#lang racket

(define (ask question)
  (cond
    [(eq? question 'a) (println 'a)]
    [(eq? question 'b) (println 'b)]
    [else (println 'other)]))

(ask 'a)
(ask 'kk)