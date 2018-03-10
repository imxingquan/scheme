#lang racket
(require math/base)
;(require "find-files-by-ext.rkt")

;按扩展名查找文件 (path ext -> list)
(define (find-files-by-ext path [ext #t])
  (define files (find-files (lambda (file)
                              #||#
                              (cond
                                 [(boolean? ext) ext]
                                 [(string? ext) (string-suffix? (path->string file) ext)]))
                              path
                              ;#:skip-filtered-directory? #t
                              ))
  ;过滤掉目录
  (filter-map (lambda (file)
              (and (file-exists? file) file))
            files)
  )

;计算行数排除空行
(define (count-line text)
  (cond [(empty? text) 0]
        [(string=? (first text) "") (count-line (rest text))]
        [else (+ 1 (count-line (rest text)))]))


;计算文件行数合计
(define (sum-line path [ext #t])
  (define all-files (find-files-by-ext path ext ))
  (define file-line-count (map (lambda (file)
                               (define count (count-line (file->lines file)))
                               (printf "[行数:~a] ~a\n" count file)
                               count
                               )
                             all-files))
  (printf "合计:~a 行" (sum file-line-count)))

;测试

(sum-line "D:/bz/src/BzProject/src/main/java" ".java")
