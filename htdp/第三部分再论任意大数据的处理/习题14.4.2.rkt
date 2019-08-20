;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.4.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
https://htdp.org/2003-09-26/Solutions/scheme-numeric.html

习题 14.4.2 开发函数 numeric?,该函数读入一个 Scheme 表达式(的表示法),判断它是不是数值的。
|#
(define-struct add (left right))
(define-struct mul (left right))

;1. (+ 10 -10)
(make-add 10 -10)
;2. (+ (* 20 3) 33)
(make-add (make-mul 20 3) 33)
;3. (* 3.14 (* r r))
(make-mul 3.14 (make-mul 'r 'r))
;4. (+ (* 9/5 c) 32)
(make-add (make-mul 9/5 'c) 32)
;5. (+ (* 3.14 (* o o))
(make-add (make-mul 3.14 (make-mul 'o 'o))
          (make-mul 3.14 (make-mul 'i 'i)))

; numeric? a-exp -> true
; 判断 a-exp 表达式是不是数值
(define (numeric? a-exp)
  (cond
    [(number? a-exp) true]
    [(symbol? a-exp) false]
    [(add? a-exp) (and (numeric? (add-left a-exp))
                       (numeric? (add-right a-exp)))]
    [(mul? a-exp) (and (numeric? (mul-left a-exp))
                       (numeric? (mul-right a-exp)))]))

(numeric? (make-add 10 -10))
(numeric? 'a)
(numeric? (make-add (make-mul 3.14 (make-mul 12 12))
          (make-mul 3.14 (make-mul 7 7))))