;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.8.3) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
#|https://htdp.org/2003-09-26/Solutions/list-1.html
习题 17.8.3 开发 sym-list=?,该函数判断两个符号表是不是相等。


;Data Definition:
a list-of-symbols is either
 1. empty or
 2. (cons s los)
 where s is a symbol and los is a list-of-symbols

;Templete
(define (sym-list=? a-list another-list)
  (cond
    [(empty? a-list)...]
    [else
      ...(first a-list)...(first another-list)...
      ...(sym-list=? (rest a-list) (rest another-list)...]))
|#
;;sym-list=? : list-of-symbols list-of-symbols -> boolean
;; to determine whether a-list and another-list
;; contain the same symbols in the same order
(define (sym-list=? a-list another-list)
  (cond
    [(empty? a-list) (empty? another-list)]
    [else
     (and (cons? another-list)
          (and (symbol=? (first a-list) (first another-list))
               (sym-list=? (rest a-list) (rest another-list))))]))


;Examples as tests:
(check-expect
 (sym-list=? empty empty)
 true)

(check-expect
 (sym-list=? empty (cons 'a empty))
 false)

(check-expect
 (sym-list=? (cons 'a empty) empty)
 false)

(check-expect
 (sym-list=? (cons 'a (cons 'b (cons 'c empty)))
             (cons 'a (cons 'b (cons 'c empty))))
 true)
(check-expect
 (sym-list=? (cons 'a (cons 'b (cons 'c empty)))
             (cons 'a (cons 'c (cons 'b empty))))
 false)