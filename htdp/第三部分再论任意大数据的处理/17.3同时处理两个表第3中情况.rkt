;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 17.3同时处理两个表第3中情况) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;; list-pack: list-of-symbols N[n>= 1] -> symbol
;; 求出alos 中的第n个符号,从1开始
(define (list-pack alos n)
  (cond
    [(and (= n 1) (empty? alos))(error 'list-pack"list too short")]
    [(and (> n 1) (empty? alos))(error 'list-pack"list too short")]
    [(and (= n 1) (cons? alos))(first alos)]
    [(and (> n 1) (cons? alos)) (list-pack (rest alos) (sub1 n))]))

(list-pack (cons 'a (cons 'b empty)) 2)
(list-pack (cons 'a (cons 'b empty)) 1)
(list-pack empty 3)