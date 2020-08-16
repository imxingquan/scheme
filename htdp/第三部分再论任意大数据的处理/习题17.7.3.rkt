;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.7.3) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
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
(make-def 'g 'x (make-mul 3 'x ))

;;3. (define (h u) (f (* 2 u)))
(make-def 'h 'u (make-app 'f (make-mul 2 'u)))

;;4. (define (i v) (+ (* v v) (* v v)))
(make-def 'i 'v (make-add (make-mul 'v 'v) (make-mul 'v 'v)))

;;5. (define (k w) (* (h w) (i w)))
(make-def 'k 'w (make-mul (make-app 'h 'w) (make-app 'i 'w)))

;;(+ (* 9/5 c) 32) 


#|习题 17.7.3 开发 evaluate-with-one-def,该函数读入一个Scheme 表达式(的表示)和函数定义(的表示)
P。
习题 14.4.1 中的其余表达式可以像以前一样计算。对于变量(的表示),函数产生一个错误信息。对
于函数调用P,evaluate-with-one-def
1. 计算参数;
2. 用参数的值替换函数主体中的参数;
3. 通过递归,计算新的表达式。这是其概要:17
(evaluate-with-one-def (subst ... ... ...)
a-fun-def)
对于其它所有函数调用,evaluate-with-one-def 产生一个错序信息。
|#

;;Templete
#|
(define (evaluate-with-one-def scheme-expression a-fun-def)
   (cond
     [(and (empty? scheme-expression) (empty? a-fun-def
|#

(define (evaluate-with-one-def a-se P)
  (cond
    [(number? a-se) a-se]
    [(symbol? a-se)(error 'evaluate-expression "got a variable")]
    [(add? a-se)(+ (evaluate-with-one-def (add-lhs a-se) P)
                   (evaluate-with-one-def (add-rhs a-se) P))]
    [(mul? a-se)(* (evaluate-with-one-def (mul-lhs a-se) P)
                   (evaluate-with-one-def (mul-rhs a-se) P))]
    [(app? a-se)
     (cond
       [(eq? (def-name P)(app-rator a-se))
        (evaluate-with-one-def
         (subst (def-body P)
                (def-arg P)
                (evaluate-with-one-def (app-rand a-se) P))
         P)]
       [else (error 'evalute-weith-one-def "not hte right def")])]))



;; subst : scheme-expression symbol number -> scheme-expression
;; replaces all occurrences of var with num in a-se
(define (subst a-se var num)
  (cond
    [(number? a-se) a-se]
    [(symbol? a-se) (if (eq? var a-se)
                        num
                        a-se)]
      [(add? a-se) (make-add (subst (add-lhs a-se) var num)
                           (subst (add-rhs a-se) var num))]
    [(mul? a-se) (make-mul (subst (mul-lhs a-se) var num)
                           (subst (mul-rhs a-se) var num))]
    [(app? a-se) (make-app (app-rator a-se)
                           (subst (app-rand a-se) var num))]))

;; EXAMPLES AS TESTS
(subst 1 'x 2)
"should be"
1

(subst 'x 'x 2)
"should be"
2

(subst 'x 'y 2)
"should be"
'x

(subst (make-mul 'x 'y) 'x 2)
"should be"
(make-mul 2 'y)

(subst (make-add 'x 'y) 'x 2)
"should be"
(make-add 2 'y)

(subst (make-app 'f 'x) 'x 2)
"should be"
(make-app 'f 2)

(define f2c-def (make-def 'f2c 'f (make-mul 5/9 (make-add 'f -32))))

(evaluate-with-one-def (make-app 'f2c 32) f2c-def)
"should be"
0

(evaluate-with-one-def (make-app 'f2c 212) f2c-def)
"should be"
100

(evaluate-with-one-def (make-app 'f2c -40) f2c-def)
"should be"
-40

; (evaluate-with-one-def (make-app 'radius 3) f2c-def)
; error!