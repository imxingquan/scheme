#lang racket
(first (list 1 2 3))
(rest (list 1 2 3))

empty

(cons "head" empty)

(cons "dead" (cons "head" empty))

;递归求长度
(define (my-len lst)
  (cond
    [(empty? lst) 0]
    [else (+ 1 (my-len (rest lst)))]))

(my-len empty)
(my-len (list "a" "bc" "dd"))