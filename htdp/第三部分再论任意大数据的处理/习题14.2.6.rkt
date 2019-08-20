;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.2.6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 14.2.6 开发函数 create-bst-from-list,这个函数读入一个由数和名字组成表,反复调用 create-bst,返
回一个 BST。
|#
(define-struct node (ssn name left right))
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


#|函数模板
(define (fun-for-lons lons)
  (cond
    [(empty? lons)...]
    [else
     (first lons)
     (fun-for-lons (rest lons))]))
|#
(define (create-bst-from-list lons)
  (cond
    [(empty? lons) false]
    [else
     (create-bst (create-bst-from-list (rest lons))
                 (first (first lons))
                 (second (first lons)))]))



(define sample 
  '((99 o) 
  (77 l) 
  (24 i) 
  (10 h) 
  (95 g) 
  (15 d) 
  (89 c) 
  (29 b) 
  (63 a)))
(create-bst-from-list sample)