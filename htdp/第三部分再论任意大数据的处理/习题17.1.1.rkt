;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题17.1.1) (read-case-sensitive #t) (teachpacks ((lib "testing.rkt" "teachpack" "htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "testing.rkt" "teachpack" "htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
#| 
习题17.1.1 一些习题曾用到过 Scheme 操作 append,该操作读入三个表,并置它们的元素:
(append (list 'a) (list 'b 'c) (list 'd 'e 'f)) 
;; 期望值：
(list 'a 'b 'c 'd 'e 'f) 
使用 replace-eol-with 来定义 our-append，它的行为类似于 Scheme 的 append
|#

(define (replace-eol-with alon1 alon2)
  (cond
    [(empty? alon1) alon2]
    [else (cons (first alon1) (replace-eol-with (rest alon1) alon2))]))

(replace-eol-with (cons 1 (cons 2 empty)) (cons 3 empty))


(define (our-append lst1 lst2 lst3)
  (replace-eol-with lst1 (replace-eol-with lst2 lst3)))


(check-expect (list 'a 'b 'c 'd 'e 'f) (our-append (list 'a 'b) (list 'c 'd) (list 'e 'f)))

(our-append (list 'a 'b) empty
            (our-append (list 'a1 'a2)(list 'a3 'a4)(list 'a5 'a6)))