#lang racket

(let ([x 4]
        [y 3])
  (+ x y))


;S 的值是 hello 输出 hi ，goodbye 输出 bye 其他输出　huh
(define (converse s)
  (define (starts? s2)
    (define len2　(string-length s2)) ; 局部变量len2
      (and (>= (string-length s) len2)
               (equal? s2 (substring s 0 len2))))
    (cond
      [(starts? "hello") "hi!"]
      [(starts? "goodbye") "bye!"]
      [else "huh?"])
)

(converse "hello!")
(converse "goodbye jack")
(converse "aaa")

;使用let 定义
(let ([x (random 4)]
      [o (random 4)])
  (cond
    [(> x o) "X wins"]
    [(> o x) "O wins"]
    [else "cat's game"]))

(let* ([x (random 4)]
         [o (random 4)]
         [diff (number->string (abs (- x o)))])
    (cond
     [(> x o) (string-append "X wins by " diff)]
     [(> o x) (string-append "O wins by " diff)]
     [else "cat's game"]))