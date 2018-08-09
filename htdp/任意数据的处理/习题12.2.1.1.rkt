;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题12.2.1.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;http://htdp.org/2003-09-26/Solutions/sort1.html
;; 习题12.2.1
;; 按照名称对邮件进行排序
;; A mail-message is a structure: 
;;    (make-mail name n s) 
;; where name is a string, n is a number, and s is a string.
(define-struct mail (from date message))

(define (sort-by-name mail-lst)
  (cond
    [(empty? mail-lst) empty ]
    [else (insert (first mail-lst) (sort-by-name (rest mail-lst)))]))

(define (insert a-mail mail-lst)
  (cond
    [(empty? mail-lst) (cons a-mail empty)]
    [else
     (cond
       [(string>=? (mail-from a-mail) (mail-from (first mail-lst)))
        (cons a-mail mail-lst)]
       [(string<? (mail-from a-mail) (mail-from (first mail-lst)))
        (cons (first mail-lst ) (insert a-mail (rest mail-lst)))
       ])]))

(insert (make-mail "Tim" 1980 "hello") empty)
(insert (make-mail "Tim" 1911 "hi")
                (cons
                 (make-mail "Mark" 1913 "hi")
                 (cons
                  (make-mail "Cim" 1912 "hi")
                  (cons
                   (make-mail "Aim" 1910 "hi") empty))))

(define d (cons
           (make-mail "Mark" 1921 "hi")
           (cons
            (make-mail "Sendim" 1956 "hi")
            (cons
             (make-mail "Zrber" 1978 "hi") empty))))
(sort-by-name d)