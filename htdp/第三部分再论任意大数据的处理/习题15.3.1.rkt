;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题15.3.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

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

;; EXAMPLE WEB PAGES
(define dogs-wp
  (make-wp 'dogs-wp 
           (list 'my 'dogs 'web 'page)))

(define cats-wp
  (make-wp 'cats-wp
           (list 'my 'cats 'web 'page)))

(define my-wp
  (make-wp 'my-wp
           (list 'see 'my 'dog dogs-wp
                 'see 'my 'cat cats-wp)))


#|
https://htdp.org/2003-09-26/Solutions/wp-count.html
习题 15.3.1 开发函数 size,该函数读入一个网页,返回其中包含的符号(单词)数
|#

;; size : a-wp -> number
;; 返回网页(body)的单词数量
(define (size a-wp)
  (size-body (wp-body a-wp)))

 (define (size-body wp-body)
   (cond
     [(empty? wp-body) 0]
     [(symbol? (first wp-body)) (+ 1 (size-body (rest wp-body)))]
     [(wp? (first wp-body))(size-body (rest wp-body))]))

(size dogs-wp) ; 4
(size my-wp) ;6