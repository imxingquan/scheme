;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.4.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 14.4.3 给出数表达式的数据定义。开发函数 evaluate-expression,该函数读入一个 Scheme 表达式(的
表示法），计算它的值。在完成这个函数的测试之后，修改它，使它可以读入所有类型的 Scheme 表达式；
如果修改后的函数遇到一个变量，它就产生一个错误信息。
|#

(define-struct add (left right))
(define-struct mul (left right))


; evaluate-expression a-exp => calc value
; 读入一个scheme表达式计算结果

(define (eval-exp a-exp)
  (cond
    [(number? a-exp) a-exp]
    [(symbol? a-exp) (error 'eval-exp "expects a variabl")]
    [(add? a-exp) (+ (eval-exp (add-left a-exp))
                     (eval-exp (add-right a-exp)))]
    [(mul? a-exp) (* (eval-exp (mul-left a-exp))
                     (eval-exp (mul-right a-exp)))]))

(eval-exp 10)
;output 10

(eval-exp (make-add 10 20))
;output 30

(eval-exp (make-mul 15 3))
;output 45

(eval-exp (make-add (make-mul 20 3) 33))
;output 93

(eval-exp (make-add (make-mul 3.14 (make-mul 7 7))
          (make-mul 3.14 (make-mul 8 8))))
;output 354.82

(eval-exp (make-add 10 'a))