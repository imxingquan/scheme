;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 习题21.1.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#| https://htdp.org/2003-09-26/Solutions/N-fold.html
习题 21.1.3 定义下列两个函数的抽象,并将其命名为natural-f:
|#

;; copy : N X -> (listof X)
;; 生成一个表,表中含有n 个obj
(define (copy n obj)
  (cond
    [(zero? n) empty]
    [else (cons obj
                (copy (sub1 n) obj))]))


;; n-adder : N number ->number
;; 只使用每次加一
;; 的方法把n 加到x 上
(define (n-adder n x)
  (cond
    [(zero? n) x]
    [else (+ 1
             (n-adder (sub1 n) x))]))

;; natural-f: Nat X (X Y -> Y) Y -> Y
(define (natural-f x y f init)
  (cond
    [(zero? x) init]
    [else (f y
             (natural-f (sub1 x) y f init))]))

;;Test
(check-expect (copy 3 'a) '(a a a))
(check-expect (natural-f 3 'a cons empty) (copy 3 'a))

(check-expect (copy 0 'a) empty)
(check-expect (natural-f 0 'a cons empty) (copy 0 'a))

(check-expect (copy 3 1) (list 1 1 1))
(check-expect (natural-f 3 1 cons empty) (copy 3 1))

;; For n-adder, let's make sure to test different init-values.

(check-expect (n-adder 3 3.14) 6.14)
(check-expect (natural-f 3 1 + 3.14) (n-adder 3 3.14))

(check-expect (n-adder 3 1) 4)
(check-expect (natural-f 3 1 + 1) (n-adder 3 1))

(check-expect (n-adder 3 2) 5)
(check-expect (natural-f 3 1 + 2) (n-adder 3 2))

(define (n-multiplier n x)
  (natural-f n x + 0))

(n-multiplier 3 4)
(check-expect (n-multiplier 0 0) 0)
(check-expect (n-multiplier 0 10) 0)
(check-expect (n-multiplier 10 0) 0)
(check-expect (n-multiplier 3 4) 12)
(check-expect (n-multiplier 4 3) 12)