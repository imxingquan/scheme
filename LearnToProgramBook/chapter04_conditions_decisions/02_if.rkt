#lang racket

#|
 (if some-expression
     an-exp
     else another-exp
|#

(if (= (+ 1 2) 3)
    'yes
    'no)

(if '(1)
    '除了#f所有的都是#t
    'no)
(if empty
    '除了#f所有的都是#t
    'no)
(if false
    '除了#f所有的都是#t
    'no)

(if (odd? 5) 'odd-number 'even-number)

