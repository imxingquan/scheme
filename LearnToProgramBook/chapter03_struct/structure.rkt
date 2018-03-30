#lang racket

;定义结构类型
;(struct struct-name (element1 element2 ...)
(struct student (name id# addr))

;创建一个结构类型的实例
(define xiaomin (student '小明 10001 '长江路118号))

;访问结构实例的成员
(printf "output: ~a ~a ~a\n" (student-name xiaomin) (student-id# xiaomin) (student-addr xiaomin))

;结构嵌套使用
(struct classes (stus teacher))
(define class-a
  (classes (list xiaomin (student '李梅 1002 '黄河路118号))
  '黄老师))
;output 小明
(student-name (first (classes-stus class-a)))
(classes-teacher class-a)

;结构的透明
(struct tran1 (el1 el2 el3))
;output: #<tran1>
(tran1 1 "hello" 2.3)
;添加#:transparent特性将会输出跟明确的结果
(struct tran2 (el1 el2 el3)#:transparent)
;output: (tran2 1 "hello" 2.3)
(tran2 1 "hello" 2.3)


