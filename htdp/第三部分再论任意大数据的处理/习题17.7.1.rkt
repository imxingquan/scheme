;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.7.1) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
#| https://htdp.org/2003-09-26/Solutions/scheme-one-def.html
习题 17.7.1 扩展习题 14.4.1 中的数据定义,使其可以表示函数调用,即在某个表达式中调用用户定义的
函数,例如(f (+ 1 1))或者(* 3 (g 2)) 等。函数调用用包含两个字段的结构体表示,前一个字段代表函数名,
后一个字段代表参数。


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
