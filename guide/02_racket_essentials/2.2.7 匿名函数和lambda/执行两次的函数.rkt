;执行两次匿名函数

#lang racket
(define (twice f v)
  (f (f v)))

;call sqrt twos
(twice sqrt 32)

(define (louder s)
  (string-append s "!"))

;; output: 你好!!
(twice louder "你好")


;使用lambda 定义匿名函数
(twice (lambda (s) (string-append s "!"))
       "您好")

