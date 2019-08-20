;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.2.5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 14.2.5 开发函数 create-bst,该函数读入 BST B、数 N 和符号 S,返回一棵 BST,该 BST 类似于 B,
但是在（原来）某个 false 子树的位置上包含 node 结构体

(make-node N S false false)
|#

(define-struct node (ssn name left right))
; A binary tree is either
; 1. false or
; 2. (make-node soc pn lft rgt)
;    where soc is a number, pn is a symbol, and lft and rgt are binary trees.

;; EXAMPLES
; (create-bst false 6 'b) => (make-node 6 'b false false)
;
; (create-bst (make-node 4 'a false false) 5 'a) 
; =>
; (make-bst 4 'a false (make-bst 5 'a false false))
;
; (create-bst (make-node 4 'a false false) 3 'g)
; =>
; (make-node 4 'a (make-node 3 'g false false) false)
;
; (create-bst (make-node 4 'a (make-node 2 'a false false) false) 3 'g)
; =>
; (make-node 4 'a (make-node 2 'a false (make-node 3 'g)))

;; 函数模板
#|
(define (bst-fun abt)
  (cond
    [(boolean? abt) ...]
    [(node? abt)
     ... (node-ssn abt)..(node-name abt)
     ... (bst-fun (node-left abt))...
     ... (bst-fun (node-right abt))...]))
|#

(define (create-bst bst n s)
  (cond
    [(eq? bst false) (make-node n s false false)]
    [else
     (cond
       [(< n (node-ssn bst))
        (make-node (node-ssn bst)
                   (node-name bst)
                   (create-bst (node-left bst) n s)
                   (node-right bst))]
       [(> n (node-ssn bst))
        (make-node (node-ssn bst)
                   (node-name bst)
                   (node-left bst)
                   (create-bst (node-right bst) n s))]
       [else (error 'create-bst "Number already in BST")])]))

(create-bst false 6 'b)
(equal? (create-bst (make-node 4 'a false false) 5 'a)
        (make-node 4 'a false (make-node 5 'a false false)))
(equal? (create-bst (make-node 4 'a false false) 3 'g)
        (make-node 4 'a (make-node 3 'g false false) false))
(equal? (create-bst (make-node 4 'a (make-node 2 'a false false) false) 3 'g)
        (make-node 4 'a (make-node 2 'a false (make-node 3 'g false false)) false))