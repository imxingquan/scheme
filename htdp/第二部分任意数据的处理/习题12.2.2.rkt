;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题12.2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;http://htdp.org/2003-09-26/Solutions/sort1.html
;; 习题12.2.2
;; search-sorted 判断一个数是否在另一个有序表中存在.

;;search : number list-of-numbers -> boolean
(define (search n alon)
  (cond
    [(empty? alon) false]
    [else (or (= (first alon) n) (search n (rest alon)))]))

(search 3 (list 10  15 23 3))
(search 7 (list 10  15 23 3))

;;开发函数search-sorted,判断某个数是否在一个有续表中出现
;;search-sorted : n list-of-number -> boolean
(define (search-sorted n alon)
  (cond
    [(empty? alon) false]
    [else (cond
            [(= n (first alon)) true]
            [(< n (first alon)) false]
            [(> n (first alon)) (search-sorted n (rest alon))])]))

(search-sorted 0 empty)
(search-sorted 2 `(1 2 3 4)) 
