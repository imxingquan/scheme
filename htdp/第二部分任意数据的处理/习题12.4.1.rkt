;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题12.4.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;习题12.4.1 给出单词表的数据定义，并系统构造单词的例子以及单词表的例子。
#|
  数据定义:
   单词(word)是下列两者之一
   1. empty,
   2. (cons a w), 其中a是符号('a,'b,....,'z)而w是单词

   单词列表 (A list-of-words)
     1. empty
     2. (cons W L) W是单词 L 是 单词列表

   示例:
     empty 是一个单词
     (list 'b) 是一个单词
     (list 'a 'b) 是一个单词
     (list 'b 'a) 是一个单词

     empty 是一个单词列表
     (list (list 'a 'b))是一个单词列表
     (list (list 'a 'b) (list 'b 'a)) 是一个单词列表

|#

#|
 arrangements : word -> listof word  
 计算所有可能的单词列表
 例如:
   empty 是一个单词列表
     - (list empty)
   (list 'a)有一个排列:(list 'a) :
     -(list (list 'a))
   (list 'a 'b) 有两个排列:
     -(list 'b 'a)
     -(list 'a 'b)
|#
(define (arrangements a-word)
  (cond
    [(empty? a-word) (cons empty empty)]
    [else (insert-everywhere/all-words (first a-word) (arrangements (rest a-word)))]))

#|
 需要一个辅助函数来实现将一个字符插入到单词任意位置并返回所有可能的单词列表
 insert-everywhere/all-words : letter list-of-words -> list-of-words
 示例:
   'a (list (list 'b))
     结果: (list (list 'a 'b) (list 'b 'a))
   'a (list (list 'b) (list 'c))
     结果:
         (list (list (list 'a 'b) (list 'b 'a))
               (list (list 'a 'c) (list 'c 'a)))
|#
(define (insert-everywhere/all-words letter lst-words)
  (cond
    [(empty? lst-words) empty]
    [else (append (insert-everywhere letter (first lst-words))
            (insert-everywhere/all-words letter (rest lst-words)))]))

#|
  inset-everywhere letter word -> list-of-words
  将一个字母插入到一个单词的每个位置,并返回所有的组合列表
  例如:
      'a (list 'b) ==> (list (list 'a 'b) (list 'b 'a))
      'a (list 'b 'c) ==> (list (list 'a 'b 'c)
                                (list 'b 'a 'c)
                                (list 'b 'c 'a))
|#
(define (insert-everywhere a-letter a-word)
  (cond
    [(empty? a-word)(list (list a-letter)) ]
    [else (cons (cons a-letter a-word)
            (add-at-begining (first a-word)
                             (insert-everywhere a-letter (rest a-word))))]))

#|
  add-at-begining letter list-of-words -> list-of-words
  增加一个字母到每一个单词表的开头
  例如:
     'a (list (list 'b 'c) (list 'c 'b))
     结果:
       (list (list 'a 'b 'c) (list 'a 'c 'b))

|#
(define (add-at-begining a-letter lo-words)
  (cond
    [(empty? lo-words)empty]
    [else (cons (cons a-letter (first lo-words))
                (add-at-begining a-letter (rest lo-words)))]))


;;Test
(add-at-begining 'a (list (list 'b 'c)(list 'c 'b)))
;;(list (list 'a 'b 'c) (list 'a 'c 'b))

(insert-everywhere 'a (list 'b))
;;(list (list 'a 'b) (list 'b 'a))

(insert-everywhere/all-words 'a (list (list 'b)))
;;(list (list 'a 'b) (list 'b 'a))

(insert-everywhere/all-words 'a (list (list 'b) (list 'c)))
;;(list (list 'a 'b) (list 'b 'a) (list 'a 'c) (list 'c 'a))

(arrangements (list 'a 'b 'c))
;(list (list 'a 'b 'c) (list 'b 'a 'c) (list 'b 'c 'a) (list 'a 'c 'b) (list 'c 'a 'b) (list 'c 'b 'a))