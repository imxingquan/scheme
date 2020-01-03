;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.3.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|

习题 17.3.1 开发 list-pick0,该函数从表中选出一个元素,类似于list-pick,但是从0 开始计数。
例如:
(symbol=? (list-pick0 (list 'a 'b 'c 'd) 3)
'd)
(list-pick0 (list 'a 'b 'c 'd) 4)
;; 希望的效果:
(error 'list-pick0 "the list is too short")
|#

#|
;;Data Definition

A list-of-symbol is either
  1. the empty list, empty or
  2. (cons s los)

(define (list-pick alos n)
  (cond
   [(and (= n 0) (empty? alos))...]
   [(and (> n 0) (empty? alos))
       ... (sub1 n)...]
   [(and (= n 0) (cons? alos))
     ... (first alos)...(rest alos)...]
   [(and (> n 0) (cons? alos))
     ... (sub1 n) ... (first alos) ... (rest alos)...]))

|#

;; list-pack0: list-of-symobls natural->number -> symbol
;; to determine the nth symbol form alos, counting
;; from 0 signals an error if therei s no nth item
(define (list-pick0 alos n)
   (cond
   [(and (= n 0) (empty? alos)) (error 'list-pick0 "the list is too short")]
   [(and (> n 0) (empty? alos)) (error 'list-pick0 "the list is too short")]
   [(and (= n 0) (cons? alos))(first alos)]
   [(and (> n 0) (cons? alos))
      (list-pick0 (rest alos) (sub1 n))]))

;Examples as Tests:
(check-error
 (list-pick0 empty 0) 
 "list-pick0: the list is too short")

(check-error 
 (list-pick0 empty 3) 
 "list-pick0: the list is too short")

(check-expect 
 (list-pick0 (list 'a) 0) 
 'a)

(check-expect 
 (list-pick0 (list 'a 'b 'c 'd) 1)
 'b)

(check-expect 
 (list-pick0 (list 'a 'b 'c 'd) 3)
 'd)

(check-error 
 (list-pick0 (list 'a 'b 'c 'd) 4)
 "list-pick0: the list is too short")