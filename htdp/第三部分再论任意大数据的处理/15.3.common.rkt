;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题15.3-common) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

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
