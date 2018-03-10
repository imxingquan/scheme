#lang racket
;(define dir "D:/tmp/common")
;(define dir "D:/tmp/autocad.2012.lite/AutoCAD_2012_32bit_Setup")
;(current-directory dir)

;枚举当前目录
(fold-files (lambda (item type result)
              (printf "file=~a type=~a result=~a~n" item type  result) )
            '())

(display "\n枚举指定目录\n")


;枚举指定目录
(fold-files (lambda (item type result)
              ;收集结果  
              (printf "file=~a type=~a result=~a~n" item type result )
              ;(cons item result)
              (cons item result)
              result
              )
            '()
            "d:/tmp/common/")



(find-files (lambda (file)
              (printf "find=~a~n" file) #f) "d:/tmp/common" #:skip-filtered-directory? #f)

;查找文件
(find-files (lambda (file)
              (printf "find=~a~n" file)
              (if (string-suffix? (path->string file) ".java") #t #f)
              ) "d:/tmp/common" #:skip-filtered-directory? #f)