;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.4.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|https://htdp.org/2003-09-26/Solutions/scheme-subst.html
习题 14.4.4 人们在计算调用(f a)时,会用 a 代替 f 的参数。更一般地说,人们在计算带变量的表达式时,
会把变量替换成值。
开发函数 subst，该函数读入变量（的表示法）V、数 N 以及一个 Scheme 表达式（的表示法），它返
回一个结构相等的表达式，把其中所有 V 的出现都替换为 N
|#


(define-struct add (left right))
(define-struct mul (left right))


;; subst : v n a-exp => a-exp
;; 使用n替换表达式a-exp中的变量v,
(define (subst v n a-exp)
  (cond
    [(number? a-exp) a-exp]
    [(symbol? a-exp) (if (eq? v a-exp)
                         n
                         a-exp)]
    [(add? a-exp)(make-add (subst v n (add-left a-exp))
                           (subst v n (add-right a-exp)))]
    [(mul? a-exp)(make-mul (subst v n (mul-left a-exp))
                           (subst v n (mul-right a-exp)))]))

(subst 'x 2 1)
;;ouput: 1
(subst 'x 2 'x)
;;output 2
(subst 'x 2 (make-mul 'x 'y))
;;output (make-mul 2 'y
(subst 'y 3 (make-add 2 'y))
;;ouput (make-add 2 3)
