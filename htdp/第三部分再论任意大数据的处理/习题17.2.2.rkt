;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
https://htdp.org/2003-09-26/Solutions/zip.html
习题 17.2.2 开发函数 zip,该函数把人名的表和电话号码的表结合成电话记录的表。假定其结构体定义如
下:
(define-struct phone-record (name number))
电话记录是由(make-phone-record s n)构造的,其中s 是符号,n 是数。假设输入的表是等长的。尽可能简化
你的定义。
|#

#|
;;Data Definition
a phone-record is a structure
  (make-phone-record s n)
where s is symbol and n is number.

a list-of-phone-record is either
   1. empty
   2. (cons pr lopr)
where pr is a phone-record and lopr is a list-of-phone-record.
|#
(define-struct phone-record (name number))

(define list-of-name
  (list 'Jack 'Merry 'Wang))
(define list-of-phone
  (list 13391939393 12319393939 083103030))

#|
;;Templete
(define (zip lon lop)
  (cond
   [(empty? lon) ...]
   [else
      ... (first lon) (first lop)...
      ... (rest lon) (rest lop)]))

|#
(define (zip lon lop)
  (cond
   [(empty? lon) empty]
   [else
       (cons (make-phone-record (first lon) (first lop))
            (zip (rest lon) (rest lop)))]))
(zip list-of-name  list-of-phone)

(check-expect empty empty)
(check-expect
(zip list-of-name  list-of-phone)
 (list
 (make-phone-record 'Jack 13391939393)
 (make-phone-record 'Merry 12319393939)
 (make-phone-record 'Wang 83103030)))