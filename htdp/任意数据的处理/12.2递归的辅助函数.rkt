;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 12.2递归的辅助函数) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

;;插入排序 递归的辅助函数

;;sort : list-of-numbers -> list-of-numbers
;;使用alon中的数,创建有序列表
#|函数模板
(define (sort alon)
  (cond
    [(empty? alon)...]
    [else ... (first alon) ... (sort(rest alon))...]))
|#


;;递归的辅助函数
;;用表alon中的数和n,创建降序排列的表
;;alon已被排好序
;; (define (insert n alon)...)
;;基于insert 给出sort的定义
;;辅助函数的意思是 将第一个元素的值插入到排好序的列表的合适位置

(define (sort alon)
  (cond
    [(empty? alon) empty]
    [else (insert (first alon) (sort(rest alon)))]))

#|
下面分析insert的实现
与sort不同,insert使用2个参数,第一个是原子值,处理表的模板如下
(define (insert n alon)
  (cond
    [(empty? alon)...]
    [else ... (first alon) ... (insert n (rest alon))...]))

示例:
 (insert 3 (cons 6 (cons 2 (cons 1 (cons -1 empty))

 (first alon) 是 6
 (insert n (rest alon)) 是 cons 3 2 1 -1

  一般特性分析:
  如果 n >= (first alon) 则 alon中的所有数都不会大于n.
  如果 n < (first alon) 还没有找到合适的位置. 这是第一个元素必定是 (first alon),而n被插入到(rst alon)中,
在这种情况下,结果是:
(cons (first alon)(insert n (rest alon))
把以上讨论翻译成条件表达式
(cond
  [(>= n (first alon))...]
  [(< n (first alon))...])

|#
(define (insert n alon)
  (cond
    [(empty? alon)(cons n empty)]
    [else (cond
            [(>= n (first alon))(cons n alon)]
            [(<  n (first alon))(cons (first alon) (insert n (rest alon)))])]))
;;测试insert          
(define list1 `(11 10 7 8 3))
(insert 9 list1)

;;测试sort
(define list2 `(2 3 9 7 6))
(sort list2)