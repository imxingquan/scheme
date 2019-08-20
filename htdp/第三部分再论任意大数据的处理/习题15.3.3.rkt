;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题15.3.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
https://htdp.org/2003-09-26/Solutions/wp-occurs.html
习题 15.3.3 开发函数 occurs,该函数读入一个符号和一个网页,判断前者有没有在后者中出现,包括在后
者的嵌入网页中出现
|#

(define (occurs a-symbol a-wp)
  (occurs-body a-symbol (wp-body a-wp)))

(define (occurs-body a-symbol a-body)
  (cond
    [(empty? a-body) false]
    [(symbol? (first a-body))
     (or (symbol=? (first a-body) a-symbol)
         (occurs-body a-symbol (rest a-body)))]
    [else
     (or (occurs a-symbol (first a-body))
         (occurs-body a-symbol (rest a-body)))]))



;; data examples:
(define empty-page (make-wp 'empty-page empty))
(define page-1-word (make-wp 'page-1-word (cons 'w1 empty)))
(define page-2-words (make-wp 'page-2-words (list 'w1 'w2)))
(define with-1-word-subpage (make-wp 'page-1-word-with-subpage (cons page-1-word empty)))
(define with-2-words-subpage (make-wp 'with-2-words-subpage (cons page-2-words empty)))
(define dense-page1 (make-wp 'realistic (list 'w3  page-2-words 'w4 page-1-word 'w5)))
(define dense-page2 (make-wp 'realistic (list 'w3  empty-page 'w4 with-1-word-subpage 'w5)))

;; test cases

;; test for 'find'
(equal? (occurs 'w1 empty-page ) false)
(equal? (occurs 'w1 page-1-word ) true)
(equal? (occurs 'w3 page-2-words ) false)
(equal? (occurs 'w2 with-2-words-subpage ) true)
(equal? (occurs 'no-in-there dense-page1 ) false)
(equal? (occurs 'w1 dense-page1 ) true)
(equal? (occurs 'w2 dense-page1 ) true)
(equal? (occurs 'w1 dense-page2 ) true)
(equal? (occurs 'w5 dense-page1 ) true)
