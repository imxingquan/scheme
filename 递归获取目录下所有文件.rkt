#lang racket
(define dir "D:/tmp/common")
(current-directory dir)
(define (dir-files dir-path)
  (directory-list dir-path))

;目录下的所有文件
(define files (dir-files dir))

(define (enums-file-in-dir dirs)
    (cond
      [(empty? dirs) empty]
      [else
        (define file-path (path->complete-path (first dirs)))
        (define file-is-dir? (not (file-exists? file-path)))
        (and file-is-dir? (current-directory file-path))
        (cond
           [file-is-dir? (enums-file-in-dir (dir-files file-path))]
           [not file-is-dir?
                (display file-path)                
                (cons  file-path (enums-file-in-dir (rest dirs)))])
       ]))

(define f (enums-file-in-dir files))



