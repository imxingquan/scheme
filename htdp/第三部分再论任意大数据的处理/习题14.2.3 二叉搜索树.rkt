;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |习题14.2.3 二叉搜索树|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 14.2.3 开发函数 inorder(中序),该函数读入一棵二叉树,返回树中所有 ssn 数组成的表。该表以
从左到右的顺序（就是前面我们所用的顺序）列出这些数
https://htdp.org/2003-09-26/Solutions/bst0.html

|#

(define-struct node (ssn name left right))

(define bt1 (make-node 66 'a  (make-node 53 'b false false) false))
(define bt2 (make-node 66 'b  (make-node 53 'a false false) false))
(define bt3 (make-node 11 'Bobby (make-node 12 'Luke false false) (make-node 5 'Paul false false))) 

(define (inorder a-bt)
  (cond
    [(boolean? a-bt) empty]
    [(node? a-bt)
      (append (inorder (node-left a-bt))
              (cons (node-name a-bt)
                    (inorder (node-right a-bt))))]))
     
     

(inorder bt1)
(inorder bt2)
(inorder bt3)