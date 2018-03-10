#lang racket
;目录
(define dir "D:/bz/src/BzProject/src/main/java/com/pansome")
(define dir2 "D:/tmp/common")
(current-directory dir2)

(define (dir-files dir-path)
  (directory-list dir-path))

;目录下的所有文件
(define files (dir-files dir2))

(define (my-maps dirs)
  (cond [(empty? dirs) empty]
        [(path? (first dirs)) (first dirs)]
        [else (files (rest dirs))]
    )
  )

files
(file-exists? (first files))
(directory-exists? (first files))

;读取文件所有行
(define lines (file->lines (first files)))

;计算行数排除空行
(define (count-line text)
  (cond [(empty? text) 0]
        [(string=? (first text) "") (count-line (rest text))]
        [else (+ 1 (count-line (rest text)))]))

(count-line lines)

;计算行数
(for/fold ([count 0])
            ([i lines])
    (add1 count))

;;计算行数排除空行
(for/fold ([count 0])
          ([i lines])
   (if (not (string=? i ""))
       (add1 count) count))
;; (define p (first files))
;;(string-suffix? (~a p) ".java")
(display "-------------------\n")


