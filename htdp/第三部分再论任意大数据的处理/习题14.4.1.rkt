;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.4.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
|#
https://htdp.org/2003-09-26/Solutions/scheme-dd.html

习题 14.4.1 给出 Scheme 表达式的表示法的数据定义,然后把下列表达式转化成该表示法:
1． (+ 10 -10) 
2． (+ (* 20 3) 33) 
3． (* 3.14 (* r r)) 
4． (+ (* 9/5 c) 32) 
5． (+ (* 3.14 (* o o)) (* 3.14 (* i i)))
#|

(define-struct add (left right))
(define-struct mul (left right))

;1. (+ 10 -10)
(make-add 10 -10)
;2. (+ (* 20 3) 33)
(make-add (make-mul 20 3) 33)
;3. (* 3.14 (* r r))
(make-mul 3.14 (make-mul r r))
;4. (+ (* 9/5 c) 32)
(make-add (make-mul 9/5 c) 32)
;5. (+ (* 3.14 (* o o))
(make-add (make-mul 3.14 (make-mul o o))
          (make-mul 3.14 (make-mul i i)))

