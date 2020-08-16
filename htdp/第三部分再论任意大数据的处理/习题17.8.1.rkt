;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.8.1) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
#| 17.8.1 相等与测试 https://htdp.org/2003-09-26/Solutions/list-4.html
;;Templete
(define (list=? a-list another-list)
  (cond
   [(and (empty? a-list) (empty? another-list))...]
   [(and (cons? a-list) (empty? another-list))
     ...(first a-list)...(rest a-list)...]
   [(and (empty? a-list) (cons? another-list))
     ...(first another-list)...(rest another-list)]
   [(and (cons? a-list) (cons? another-list))
     ...(first a-list)...(first another-list)...
     ...(list=? (rest a-list) (rest another-list))...
     ...(list=? a-list (rest another-list))...
     ...(list=? (rest a-list) another-list...]))


|#

;; list=? : list-of-numbers list-of-numbers -> boolean

(define (list=? a-list another-list)
  (cond
    [(and (empty? a-list) (empty? another-list))true]
    [(and (cons? a-list) (empty? another-list)) false]
    [(and (empty? a-list) (cons? another-list)) false]
    [(and (cons? a-list) (cons? another-list))
     (and (= (first a-list) (first another-list))
          (list=? (rest a-list) (rest another-list)))]))

;;Example test

(check-expect true (list=? empty empty))

(check-expect (list=? (cons 1 empty) empty) false)

(check-expect (list=? (cons 1 (cons 2 empty)) (cons 1 (cons 2 empty))) true)

#|

(define (list=? a-list another-list)
(cond
[(empty? a-list) ...]
[(cons? a-list)
... (first a-list) ... (first another-list) ...
... (list=? (rest a-list) (rest another-list)) ...]))
|#
(define (list2=? a-list another-list)
  (cond
    [(empty? a-list) (empty? another-list)]
    [(cons? a-list)
     (and (cons? another-list)
          (and (= (first a-list) (first another-list))
               (list2=? (rest a-list) (rest another-list))))]))

;;Example test

(check-expect true (list2=? empty empty))

(check-expect (list2=? (cons 1 empty) empty) false)

(check-expect (list2=? (cons 1 (cons 2 empty)) (cons 1 (cons 2 empty))) true)
