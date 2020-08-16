;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.8.4) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
#|https://htdp.org/2003-09-26/Solutions/list-1.html

习题 17.8.4 开发 contains-same-numbers,该函数判断两个数表是否包含相同的数,而不管它们的顺序。例
如
(contains-same-numbers (list 1 2 3) (list 3 2 1))
计算出true。


;Data Definition:
a list-of-numbers is either:
  1. empty or
  2. (cons n lon)
  where n is a number and lon is a list-of-numbers

;Templete:

(define (contains-same-numbers a-list another-list)
  (cond
    [(empty? a-list)...]
    [else
      ...(first a-list)... (first another-list)...
      ...(contains-same-numbers (rest a-list) (rest another-list))...]))

|#

;;contains-same-numbers:
;; list-of-numbers list-of-numbers -> boolean
;;to determine whether a-list and another-list
;;contain the same numbers. Numbers do not need
;;to be in the same order.
(define (contains-same-numbers a-list another-list)
  (and
   (all-in? a-list another-list)
   (all-in? another-list a-list)))

;Examples and Tests:
(check-expect
 (contains-same-numbers empty empty) 
 true)

(check-expect
 (contains-same-numbers empty (list 1)) 
 false)

(check-expect
 (contains-same-numbers (list 1) empty)
 false)

(check-expect
 (contains-same-numbers (list 1 2 3) 
                        (list 1 2 3)) 
 true)

(check-expect
 (contains-same-numbers (list 1 2 3) 
                        (list 1 3)) 
 false)

(check-expect
 (contains-same-numbers (list 1 2 3) 
                        (list 1 3 2)) 
 true)

(check-expect
 (contains-same-numbers (list 1 2 3) 
                        (list 3 1 2)) 
 true)

;;包含同样的数字
(check-expect
 (contains-same-numbers (list 1 1 1 1 1) 
                        (list 1)) 
 true)

(check-expect
 (contains-same-numbers (list 1) 
                        (list 1 1 1 1 1)) 
 true)
;;包含同样的数字
(check-expect
 (contains-same-numbers (list 1 2 3)
                        (list 1 3 2 2))
 true)


#|We need a helper function that identifies if
all the numbers in a list in another list
--------------------------------------------------
将another-lon 作为原子处理
;Templete:
(define (all-in? a-lon another-lon)
  (cond
    [(empty? a-lon)...]
    [else
      ...(first a-lon)...
      ...(all-in? (rest a-lon) another-lon)...]))

|#
;;all-in? : list-of-number list-of-numbers -> boolean
;;consumes a list-of-numbers and another list-of-numbers and returns
;;true if all the numbers in the first list are also in the second list
(define (all-in? a-lon another-lon)
  (cond
    [(empty? a-lon) true]
    [else
     (and (one-in? (first a-lon) another-lon)
          (all-in? (rest a-lon) another-lon))]))

;Examples and Tests:
(check-expect
 (all-in? empty empty)
 true)

(check-expect
 (all-in? (list 5) (list 5))
 true)

(check-expect
 (all-in? (list 5 8 7) (list 8 7 5))
 true)

(check-expect
 (all-in? (list 5 4) (list 3 4 5))
 true)

(check-expect
 (all-in? (list 3 4 5) (list 5 4))
 false)

#|We need a helper function that identifies if 
a number is in a list
------------------------------------------------------------
;Templete:
(define (one-in? n a-lon)
  (cond
    [(empty? a-lon)...]
    [else
      ...(first a-lon)...
      ...(one-in? n (rest a-lon))...])))

|#

;;one-in? : number list-of-numbers -> boolean
;;consumes a number and a list-ofnumbers and returns true
;;if the number is in the list,false otherwise
(define (one-in? n a-lon)
  (cond
    [(empty? a-lon) false]
    [else
     (or (= n (first a-lon))
         (one-in? n (rest a-lon)))]))

;Examples and Tests:
(check-expect
 (one-in? 5 empty)
 false)

(check-expect
 (one-in? 5 (list 5))
 true)

(check-expect
 (one-in? 5 (list 5 7 4))
 true)

(check-expect
 (one-in? 5 (list 4 7 5 2))
 true)

(check-expect
 (one-in? 5 (list 4 3 7 9 2))
 false)