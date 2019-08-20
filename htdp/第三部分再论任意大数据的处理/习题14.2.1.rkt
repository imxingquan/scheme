;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.2.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 14.2.1 按照图 14.4 的方法,给出上述的两棵树的形象表示。然后开发 contains-bt,该函数读入一个
数和一棵 BT，判断这个数是否在树中出现
https://htdp.org/2003-09-26/Solutions/bst1.html

|#

(define-struct node (ssn name left right))

(define bt1 (make-node 11 'Bobby false (make-node 12 'Luke false false)))
(define bt2 (make-node 11 'Bobby (make-node 12 'Luke false false) false))
(define bt3 (make-node 11 'Bobby (make-node 12 'Luke false false) (make-node 5 'Paul false false))) 

(define (contains-bt? num a-bt)
  (cond
    [(boolean? a-bt) false]
    [else
     (or (= num (node-ssn a-bt))
         (contains-bt? num (node-left a-bt))
         (contains-bt? num (node-right a-bt)))]))


(contains-bt? 5 bt3)
(contains-bt? 13 bt3)