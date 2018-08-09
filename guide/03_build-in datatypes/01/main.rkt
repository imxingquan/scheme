#lang racket

;booleans

(= 2 (+ 1 1))
;#t
(boolean? #t)
;#t
(boolean? #f)
;#t
(boolean? "no")
;#f
(if "no" 1 0)
