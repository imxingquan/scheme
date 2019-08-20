;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |习题 13.1.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|

习题 13.1.3 在一些特殊的情况下,我们会同时使用 cons 和 list:
1． (cons 'a (list 0 false)) 
2． (list (cons 1 (cons 13 empty))) 
3． (list empty empty (cons 1 empty)) 
4． (cons 'a (cons (list 1) (list false empty))) 
改写它们，使其只包含 list。
|#

(cons 'a (list 0 false))
(list 'a  0 false)

(list (cons 1 (cons 13 empty)))
(list (list 1 13))


(list empty empty (cons 1 empty))
(list empty empty (list 1))

(cons 'a (cons (list 1) (list false empty)))
(list 'a (list 1) (list false empty) )