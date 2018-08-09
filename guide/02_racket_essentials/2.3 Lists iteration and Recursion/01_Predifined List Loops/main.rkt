;2.3.1 Predifined List Loops

#lang racket
;sqrt 函数应用在list的每个元素上
(map sqrt (list 1 4 9 16))

;为每一个list元素应用lambda
(map (lambda (i)
       (string-append i "!"))
     (list "peanuts" "咳咳咳" "cratekjack"))

;andmap 和 ormap  合并结果
(andmap string? (list　"a" "b" "c")) ;#t
(andmap string? (list "a" "b" 6))    ;#f
(ormap number? (list "a" "b" 6))    ;#t

;filter 过滤列表
(filter string? (list "a" "b" 6))
(filter positive? (list 1 -2  6 7 0)) ;过滤复数

(map (lambda (s n) (substring s 0 n))
     (list "peanuts" "popcorn" "creakerjack")
     (list 2 3 7))


