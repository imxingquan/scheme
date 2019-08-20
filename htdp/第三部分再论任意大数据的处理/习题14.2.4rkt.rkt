;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.2.4rkt) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 14.2.4 开发 search-bst,该函数读入数 n 和一个 BST。如果这棵树中包含一个 node 结构体,其 soc 字
段为 n，函数就返回这个节点的 pn 字段的值。否则，函数返回 false。函数必须利用 BST 不变式，尽可能
地减少比较的次数。请比较在二叉搜索树中进行的查找和在有序表中进行的查找（习题 12.2.2）。

|#

(define-struct node (ssn name left right))


(define bt3 (make-node 11 'Bobby (make-node 10 'Luke false false) (make-node 12 'Paul false false))) 


(define (search-bst n bst)
  (cond
    [(boolean? bst) false]
    [else
     (cond
       [(= n (node-ssn bst)) (node-name bst)]
       [(< n (node-ssn bst)) (search-bst n (node-left bst))]
       [(> n (node-ssn bst)) (search-bst n (node-right bst))])]))

(search-bst 11 bt3)
(search-bst 12 bt3)
(search-bst 8 bt3)