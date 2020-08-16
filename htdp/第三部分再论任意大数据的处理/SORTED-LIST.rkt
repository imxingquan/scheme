;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname SORTED-LIST) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
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

