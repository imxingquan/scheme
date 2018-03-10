
#lang racket
(define dir "D:/tmp/common")
;(define dir "D:/tmp/autocad.2012.lite/AutoCAD_2012_32bit_Setup")
(current-directory dir)
(define (enum-files dir)
  (directory-list dir))


(define t (enum-files dir))
(define f (directory-list (first t)))

(define (get-files files)
   (cond
    [(empty? files) empty]
    [(not (file-exists? (first files)))
     (println (path->complete-path (first files)))
     ;(current-directory (path->complete-path (first files)))
     (get-files (enum-files (first files)))
     (get-files (rest files))]
    [else
     (println (path->complete-path (first files)))
     (cons (path->complete-path (first files)) (get-files (rest files)))]))

  


;(enum-files dir)

;(get-files (enum-files dir))

(fold-files (lambda (a b result)(printf "a=~a b=~a c=~a~n" a b (list? result) )) '())

