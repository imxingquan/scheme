;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题11.2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题11.2.2 设计函数tabulate-f 把函数f应用与一些由自然数值组成的表
具体地说，函数读入自然数 n，返回由 n 个 posn 结构体组成的表，
表的第一个元素是点(n (f n))，第二个元
素是点(n-1 (f n-1))，以此类推
|#
;; f : number -> number
(define (f x)
(+ (* 3 (* x x))
(+ (* -6 x)
-1)))

#|
 (define (tabulate-f n)
  (cond [(zero? n) empty]
        [else ... (tabulate-f (sub1 n)) ...]))
|#
 (define (tabulate-f n)
  (cond [(zero? n) empty]
        [else (cons (make-posn n (f n)) (tabulate-f (sub1 n)) )]))

(tabulate-f 10)