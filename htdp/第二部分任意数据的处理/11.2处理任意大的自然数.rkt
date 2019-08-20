;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 11.2处理任意大的自然数) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;设计函数hellos,以自然数n为参数,输出为由n个'hello构成的表,合约为:
;;hellos : N -> list-of-symbols
#|
(define (hellos n)
  (cond
    [(zero? n) ... ]
    [else ... (hellos (sub1 n)) ...]))
|#
(define (hellos n)
  (cond
    [(zero? n) empty ]
    [else (cons 'hello (hellos (sub1 n)))]))

(hellos 3)

