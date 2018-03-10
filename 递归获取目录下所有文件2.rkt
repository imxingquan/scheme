#lang racket
(define dir "D:/tmp/common")
;(define dir "D:/tmp/autocad.2012.lite/AutoCAD_2012_32bit_Setup")

(define (enum-files dir)
  (current-directory dir)
  (define lst (directory-list dir))
  (print "lst")
  (println lst)
  (get-files (directory-list dir)))


(define (get-files files)
  (cond
    [(empty? files) empty]
    [(file-exists? (first files)) (first files)]
    [(not (file-exists? (first files)))
     (print "目录")
     (println (path->complete-path(first files)))
     (enum-files (path->complete-path(first files)))
     ]
    [else
     (println (path->complete-path(first files)))
       (cons (path->complete-path(first files)) (get-files (rest files)))
     ]))


(enum-files dir)
