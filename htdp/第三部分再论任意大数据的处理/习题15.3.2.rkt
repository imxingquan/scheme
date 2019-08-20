;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题15.3.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
https://htdp.org/2003-09-26/Solutions/wp-to-file.html
习题 15.3.2 开发函数 wp-to-file,该函数读入一个网页,返回符号表。该表包含网页主体中所有单词以及
嵌入网页的所有头部，而忽略直接嵌入网页的主体。
|#

(define (wp-to-file webpage)
  (wp-to-file-body (wp-body webpage)))

(define (wp-to-file-body a-body)
  (cond
    [(empty? a-body) empty]
    [(symbol? (first a-body)) (cons (first a-body)
                                    (wp-to-file-body (rest a-body)))]
    [(wp? (first a-body)) (cons (wp-header (first a-body))
                                (wp-to-file-body(rest a-body)))]))



;; data examples:
(define empty-page (make-wp 'empty-page empty))
(define page-1-word (make-wp 'page-1-word (cons 'w1 empty)))
(define page-2-words (make-wp 'page-2-words (list 'w1 'w2)))
(define with-1-word-subpage (make-wp 'page-1-word-with-subpage (cons page-1-word empty)))
(define with-2-words-subpage (make-wp 'with-2-words-subpage (cons page-2-words empty)))
(define dense-page1 (make-wp 'realistic (list 'w3  page-2-words 'w4 page-1-word 'w5)))
(define dense-page2 (make-wp 'realistic (list 'w3  empty-page 'w4 with-1-word-subpage 'w5)))

;; test cases

;; test for 'wp-to-file'
(equal? (wp-to-file empty-page) (list))
(equal? (wp-to-file page-1-word) (list 'w1))
(equal? (wp-to-file page-2-words) (list 'w1 'w2))
(equal? (wp-to-file with-1-word-subpage) (list 'page-1-word))
(equal? (wp-to-file with-2-words-subpage) (list 'page-2-words))
(equal? (wp-to-file dense-page1) (list 'w3 'page-2-words 'w4 'page-1-word 'w5))
(equal? (wp-to-file dense-page2) (list 'w3 'empty-page 'w4 'page-1-word-with-subpage 'w5))

;; --- end test code
