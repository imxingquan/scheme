#lang racket
;For Loops
(define current-dirs (directory-list (current-directory)))

;for 循环
(for ([i '(1 2 3 4 abc "abc")])
      (display i))

(for ([i current-dirs])
  (display i))