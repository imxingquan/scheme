#lang racket
;;会错误
(let ([x (random 4)]
      [y (+ 1 x)])
  (printf "~a ~a" x y))

;;let* 允许后面的子句使用前面定义的绑定
(let* ([x (random 4)]
      [y (+ 1 x)])
  (printf "~a ~a" x y))
