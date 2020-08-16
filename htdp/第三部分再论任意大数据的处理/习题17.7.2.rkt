;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.7.2) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
#| https://htdp.org/2003-09-26/Solutions/scheme-prog-dd.html
习题 17.7.2 给出定义的结构体定义和数据定义。回忆一下,函数定义有三个基本属性:
1. 函数的名字,
2. 参数的名字,
3. 函数的主体。
这表明我们要引入一个结构体,包含三个字段,前两个字段是符号,最后一个字段代表函数的主体,也就
是一个表达式。
把下列定义转化为 Scheme 值:
1. (define (f x) (+ 3 x))
2. (define (g x) (* 3 x))
3. (define (h u) (f (* 2 u)))
4. (define (i v) (+ (* v v) (* v v)))
5. (define (k w) (* (h w) (i w)))


A scheme-expression is either:
  - number,
  - symbol,
  - (make-add scheme-expression scheme-expression)
  - (make-mul scheme-expression scheme-expression)
  - (make-app symbol scheme-expression)
|#

(define-struct add (lhs rhs))
(define-struct mul (lhs rhs))
(define-struct app (rator rand))

;;example

;;(f (+ 1 1))
(make-app 'f (make-add 1 1))

;;(* 3 (g 2))
(make-mul 3 (make-app 'g 2))


#|
A scheme-def is:
 (make-def symbol symbol scheme-expr)

|#

(define-struct def (name arg body))

;;1. (define (f x) (+ 3 x))
(make-def 'f 'x (make-add 3 'x))

;;2. (define (g x) (* 3 x))
(make-def 'g x (make-mul 3 'x ))

;;3. (define (h u) (f (* 2 u)))
(make-def 'h 'u (make-app 'f (make-mul 2 u)))

;;4. (define (i v) (+ (* v v) (* v v)))
(make-def 'i 'v (make-add (make-mul v v) (make-mul v v)))

;;5. (define (k w) (* (h w) (i w)))
(make-def 'k 'w (make-mul (make-app 'h 'w) (make-app 'i 'w)))

;;(+ (* 9/5 c) 32) 

