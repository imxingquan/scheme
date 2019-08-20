;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 14.2.2 开发 search-bt,该函数读入数 n 和一棵 BT。如果这棵树中包含一个 node,其 soc 字段值为 n,
函数就返回这个节点的 pn 字段的值；否则，函数返回 false。


|#

(define-struct node (ssn name left right))

(define bt1 (make-node 11 'Bobby false (make-node 12 'Luke false false)))
(define bt2 (make-node 11 'Bobby (make-node 12 'Luke false false) false))
(define bt3 (make-node 11 'Bobby (make-node 12 'Luke false false) (make-node 5 'Paul false false))) 

(define (search-bt? num a-bt)
  (cond
    [(boolean? a-bt) false]
    [else
     (cond
       [(= (node-ssn a-bt) num) num]
       [(boolean? (search-bt? num (node-left a-bt)))
        (search-bt? num (node-right a-bt))]
       [else (search-bt? num (node-left a-bt))])]))


(search-bt? 11 bt1)
(search-bt? 5 bt3)
(search-bt? 5 bt2)