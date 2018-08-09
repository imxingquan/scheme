#lang racket

(define (my-length lst)
  ;local function iter:
  (define (iter lst len)
    (cond
      [(empty? lst) len]
      [else (iter (rest lst) (+ len 1))]))
  (iter lst 0))

(my-length (list "a" "b" "c"))

(define (my-map f lst)
  (define (iter lst backward-result)
    (cond
      [(empty? lst) (reverse backward-result)]
      [else (iter (rest lst)
                  (cons (f (first lst))
                        backward-result))]))
  (iter lst empty))

(my-map string-upcase (list "a" "b"))


(define (my-map2 f lst)
  (for/list ([i lst])
    (f i)))

(my-map2 string-upcase (list "a" "c"))