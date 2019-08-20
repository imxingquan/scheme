;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |习题 13.1.4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 13.1.4 给出下列表达式的值:
1． (list (symbol=? 'a 'b) (symbol=? 'c 'c) false) 
2． (list (+ 10 20) (* 10 20) (/ 10 20)) 
3． (list 'dana 'jane 'mary 'laura)
|#

(list (symbol=? 'a 'b) (symbol=? 'c 'c) false)
(list false true false)

(list (+ 10 20) (* 10 20) (/ 10 20))
(list 30 200 0.5)

(list 'dana 'jane 'mary 'laura)