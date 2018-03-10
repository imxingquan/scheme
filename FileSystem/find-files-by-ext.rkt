#lang racket
(provide find-files-by-ext)

;按扩展名查找文件 (path ext -> list)
(define (find-files-by-ext path [ext #t])
                          (find-files (lambda (file)
                                        #||#
                                        (cond
                                          [(boolean? ext) ext]
                                          [(string? ext) (string-suffix? (path->string file) ext)])
                                        )
                                     
                                      path
                                      ;#:skip-filtered-directory? #t
                                      ))
#||#
(display "所有文件包含目录\n")
(find-files-by-ext "d:/tmp/common" )

#|
(display "指定扩展名的文件\n")
(find-files-by-ext "d:/tmp/common" ".java")

(define htmlfile (find-files-by-ext "D:/bz/spring.git" ".html"))
|#

(define f (find-files-by-ext "d:/tmp/common" ))
;排除目录
(filter-map (lambda (file)
              (and (file-exists? file) file))
            f)
