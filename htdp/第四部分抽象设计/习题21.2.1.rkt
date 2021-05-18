;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname 习题21.2.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
#|https://htdp.org/2003-09-26/Solutions/build-list1.html
习题 21.2.1 使用 build-list
1. 创建表(list 0 ... 3)以及(list 1 ... 4);
2. 创建表(list .1 .01 .001 .0001);
3. 定义 evens,它读入自然数n,返回由前n 个偶数组成的表;
4. 定义习题 21.1.1 中的tabulate;
5. 定义 diagonal,它读入自然数n,创建由0、1 表组成的表(对角矩阵)。
例子:
(equal? (diagonal 3)
(list
(list 1 0 0)
(list 0 1 0)
(list 0 0 1)))
在函数定义的过程中,如果需要使用辅助函数,请使用局部函数。
|#

;; 1. 创建表(list 0 ... 3)以及(list 1 ... 4);
(define (f x) x)
(build-list 4 f)
(build-list 4 add1)

;;2. 创建表(list .1 .01 .001 .0001);
(define (fraction i) (/ 1 (expt 10 (+ i 1))))
(build-list 4 fraction)
(equal? (build-list 4 fraction) (list .1 .01 .001 .0001))

;;3. 定义 evens,它读入自然数n,返回由前n 个偶数组成的表;
;; events n -> (lists-of y)

(define (events n)
  (local ((define (even i) (* 2 i)))
    (build-list n even)))
(events 5)

;; 4. 定义习题 21.1.1 中的tabulate
;; tabulate: (Nat -> A) Nat -> Listof[A]
(define (tabulate.v1 f n)
  (local ((define (fprime i) (f (- n i))))
    (build-list (+ n 1) fprime)))

(define (tabulate f n)
  (reverse (build-list (+ n 1) f)))

(tabulate.v1 identity 4)
(equal? (tabulate.v1 identity 4) (list 4 3 2 1 0))
(equal? (tabulate.v1 sin 4) (list (sin 4) (sin 3) (sin 2) (sin 1) (sin 0)))
(tabulate identity 4)

(reverse '(1 2 3 4 5))


;5. 定义 diagonal,它读入自然数n,创建由0、1 表组成的表(对角矩阵)。
;; diagonal : Nat -> (listof (listof (union 0 1))
(define (diagonal n)
  (local ((define (rows i)
            (local ((define (element j)
                      (cond
                        [(= i j) 1]
                        [else 0])))
              (build-list n element))))
    (build-list n rows)))
(diagonal 3)

(define (rows i)
  (local ((define (element j)
            (cond
              [(= i j) 1]
              [else 0])))
    (build-list 3 element)))
(rows 0)