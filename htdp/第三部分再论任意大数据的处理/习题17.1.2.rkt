;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题17.1.2) (read-case-sensitive #t) (teachpacks ((lib "testing.rkt" "teachpack" "htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "testing.rkt" "teachpack" "htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
#|
习题 17.1.2 开发 cross,该函数读入一个符号表和一个数表,返回所有可能的符号——数对。
例如：
(cross '(a b c) '(1 2)) 
;; 期望值：
(list (list 'a 1) (list 'a 2) (list 'b 1) (list 'b 2) (list 'c 1) (list 'c 
2))

;数据定义
A list-of-numbers is either
  1. empty or
  2. (cons n lon) 
     where n is a number and lon is a list-of-numbers

A list-of-symbols is either 
  1. empty or
  2. (cons s los) 
     where s is a symbol and los is a list-of-symbols

A pair is
  (list s n)
  where s is a symbol and n is a number

A list-of-pairs is either
  1. empty or
  2. (cons p lop) 
     where p is a pair and lop is a list-of-pairs

;list template:
(define (cross alos alon)
  (cond
    [(empty? alos) ...]
    [else ... (first alos)... 
          ... (cross (rest alos) alon)... ]
|#

(define (cross alos alon)
  (cond
    [(empty? alos) empty]
    [else
     (append (make-pairs (first alos) alon)
             (cross (rest alos) alon))]))


#|
(define (make-pairs asymbol alon)
  (cond
    [(empty? alon)...]
    [else ... (first alon)...
          ... (make-pairs asymbol (rest alon))...]))
|#
(define (make-pairs asymbol alon)
  (cond
    [(empty? alon) empty]
    [else (cons (list asymbol (first alon))
                (make-pairs asymbol (rest alon)))]))

;Tests:
(check-expect 
 (make-pairs 'a empty)
 empty)

(check-expect 
 (make-pairs 'a (list 1))
 (list (list 'a 1)))

(check-expect 
 (make-pairs 'a (list 1 2))
 (list (list 'a 1) (list 'a 2)))

(check-expect 
 (make-pairs 'a (list 1 2 3))
 (list (list 'a 1) (list 'a 2) (list 'a 3)))
 
