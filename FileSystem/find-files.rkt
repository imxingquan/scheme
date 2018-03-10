#lang racket

;(define dir "D:/tmp/common")
;(define dir "D:/tmp/autocad.2012.lite/AutoCAD_2012_32bit_Setup")
;(current-directory dir)


(find-files (lambda (file)
              (printf "find=~a~n" file) #f) "d:/tmp/common" #:skip-filtered-directory? #f)

;查找文件
(find-files (lambda (file)
              (printf "find=~a~n" file)
              (if (string-suffix? (path->string file) ".java") #t #f)
              ) "d:/tmp/common")

