#lang racket
(require "../comm.rkt")

;询问是否未0?
(printfn (zero? 42))
;两个symbol 是否相等?
(printfn (symbol=? 'a 'b))
;是否相等
(printfn (eq? true #t))
(printfn (eq? 'a 'a))

(struct employee(id name)#:transparent)
(define emp1 (employee 102 'Jack))

;output: #t
(printfn (employee? emp1))

(printfn (number? 'a))
(printfn (string? "hello world"))
(printfn (boolean? "false"))

(printfn (= 1 2))
(printfn (boolean=? #f #f))
(printfn (string=? "hello" "hello"))
