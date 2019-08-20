;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题15.3.4) (read-case-sensitive #t) (teachpacks ((lib "testing.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "testing.rkt" "teachpack" "htdp")) #f)))
;; web datastruct
(define-struct wp (header body))

#|
Web-page 是网页
(make-wp h p)
其中h是符号,p是 web docuemnt

 Web docuemnt是下列三者之一
1. empty
2. (cons s p) 其中s是符号,p docuemnt
3. (cons w p) 其中w是网页 p docuemnt
|#
#| fun template 
(define (func a-wp)
  ...(wp-header w-ap)...
  ...(wp-body a-wp)...
  ...(fun-body wp-body)...)

(defien (fun-body wp-body)
  (cond
    [(empty? wp-body)...]
    [else ...(func (first wp-body))...(fun-body (rest wp-body))]))
|#

#|

习题 15.3.4 开发函数 find,这个函数读入一个网页和一个符号。如果该符号没有在该网页和它的嵌入网页
中出现，函数就返回 false。如果该符号至少出现了一次，函数就返回通往该符号的路上所遇到的头部组成
的表。

|#


(define (find a-wp a-word)
  (append-or-false (list (wp-header a-wp))
                   (find-in-document (wp-body a-wp) a-word)))


(define (append-or-false x y)
  (cond
    [(boolean? y) y]
    [else (append x y)]))

(define (find-in-document a-page a-word)
  (cond
    [(empty? a-page) false]
    [(symbol? (first a-page))(cond
                               [(symbol=? (first a-page) a-word) empty]
                               [else (find-in-document (rest a-page) a-word)])]
    [else (local ((define in-subpage (find (first a-page) a-word)))
            (cond
              [(boolean? in-subpage)(find-in-document (rest a-page) a-word)]
              [else in-subpage]))]))







;; data examples:
(define empty-page (make-wp 'empty-page empty))
(define page-1-word (make-wp 'page-1-word (cons 'w1 empty)))
(define page-2-words (make-wp 'page-2-words (list 'w1 'w2)))
(define with-1-word-subpage (make-wp 'page-1-word-with-subpage (cons page-1-word empty)))
(define with-2-words-subpage (make-wp 'with-2-words-subpage (cons page-2-words empty)))
(define dense-page1 (make-wp 'realistic (list 'w3  page-2-words 'w4 page-1-word 'w5)))
(define dense-page2 (make-wp 'realistic (list 'w3  empty-page 'w4 with-1-word-subpage 'w5)))

;; test cases

; test for 'append-or-false'
(check-expect (append-or-false empty false) false)
(check-expect (append-or-false empty empty) empty)
(check-expect (append-or-false (list 'a) false) false)
(check-expect (append-or-false (list 'a) empty) (list 'a))
(check-expect (append-or-false (list 'a) (list 'b)) (list 'a 'b))

;; test for 'find'
(check-expect (find empty-page 'w1) false)
(check-expect (find page-1-word 'w1) (list 'page-1-word))
(check-expect (find page-2-words 'w3) false)
(check-expect (find with-2-words-subpage 'w2) (list 'with-2-words-subpage 'page-2-words))
(check-expect (find dense-page1 'no-in-there) false)
(check-expect (find dense-page1 'w1) (list 'realistic 'page-2-words))
(check-expect (find dense-page1 'w2) (list 'realistic 'page-2-words))
(check-expect (find dense-page2 'w1) (list 'realistic 'page-1-word-with-subpage 'page-1-word))
(check-expect (find dense-page1 'w5) (list 'realistic))
(generate-report)