;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题11.2.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;习题11.2.1 把 hellos 一般化为 repeat，该函数读入自然数 n 和一个符号，返回包含 n 个符号的表
(define (repeat symbol n)
  (cond
    [(zero? n) empty]
    [else (cons symbol (repeat symbol (sub1 n)))]))

(repeat '😈 10)
(repeat '👻 10)