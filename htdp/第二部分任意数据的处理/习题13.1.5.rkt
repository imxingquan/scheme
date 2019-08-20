;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题13.1.5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 13.1.5 给出下列表达式的值:
(first (list 1 2 3)) 
(rest (list 1 2 3))
|#

(= (first (list 1 2 3)) 1)

(rest (list 1 2 3))
(list 2 3)