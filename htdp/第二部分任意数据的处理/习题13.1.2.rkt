;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题13.1.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|

习题 13.1.2 先确定每个表以及每个嵌套的表包含多少个元素,然后使用 list 表示下列表:
1． (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty))))) 
2． (cons (cons 1 (cons 2 empty)) empty) 
3． (cons 'a (cons (cons 1 empty) (cons false empty))) 
4． (cons (cons 1 (cons 2 empty)) (cons (cons 2 (cons 3 empty)) empty)) 

|#

(cons 'a (cons 'b (cons 'c (cons 'd (cons 'e empty)))))
(list 'a 'b 'c 'd 'e)

(cons (cons 1 (cons 2 empty)) empty)
(list (list 1 2))

(cons 'a (cons (cons 1 empty) (cons false empty)))
(list 'a (list  1) false)

(cons (cons 1 (cons 2 empty)) (cons (cons 2 (cons 3 empty)) empty))
(list (list 1 2) (list 2 3))