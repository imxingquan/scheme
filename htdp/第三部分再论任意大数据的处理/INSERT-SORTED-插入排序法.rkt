;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname INSERT-SORTED-插入排序法) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
;;插入排序
;;Template:
#|
(define (sort-lst alons)
  (cond
   [(empty? alons)...]
   [else
     ...(first alons)...
     ...(sort-lst (rest alons)...]))
|#
;; sort-lst : a-list-of-numbers -> a-list-of-numbers(sorted)

(define (sort-lst alons)
  (cond
    [(empty? alons) empty]
    [else
     (insert-lst (first alons)
                 (sort-lst (rest alons)))]))

;;we need helper function
;;Template:
#|
(define (insert-lst number alons)
  (cond
   [(empty? alons)...]
   [else
       ...(first alons)...
       ...(insert-lst number (rest alons))...]))

|#
;;insert-lst : number a-list-of-numbers
(define (insert-lst number alons)
  (cond
    [(empty? alons) (list number)]
    [else
     (cond
       [(< number (first alons))
        (cons number alons)]
       [else
        (cons (first alons) 
              (insert-lst number (rest alons)))])]))

;;example test
(check-expect
 (insert-lst 3 (list 2 4 5))
 (list 2 3 4 5))
(check-expect
 (insert-lst 6 (list 2 4 5))
 (list 2 4 5 6))

(sort-lst (list 2 3 1 5))
(sort-lst (list 1 7 5 2 3))