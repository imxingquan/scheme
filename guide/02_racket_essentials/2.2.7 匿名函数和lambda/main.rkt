;执行两次匿名函数

#lang racket
(define (twice f v)
  (f (f v)))

;call sqrt twos
(twice sqrt 32)

;定louder 为字符串末尾加 "!"
(define (louder s)
  (string-append s "!"))

;; output: 你好!!
(twice louder "你好")


;使用lambda 定义匿名函数
(twice (lambda (s) (string-append s "!"))
       "您好")

;为lambda函数定义个名称
(define (make-add-suffix s2)
  (lambda (s) (string-append s s2)))
;输出 "在这里!"
(twice (make-add-suffix "!") "在这里")
(twice (make-add-suffix "##") "大口大口的")

;在进一步封装
(define louder2 (make-add-suffix "@"))

(twice louder2 "在这里")