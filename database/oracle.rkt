;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname oracle) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
#lang racket
(require db)
(define odbc
  (odbc-connect #:server "10.10.2.43"
                 #:port 3306
                 #:database "gysdjz"
                 #:user "sdjz"  	
                 #:password "sdjz$#147258"   
                 #:ssl 'no))

#|
(query odbc
       "SELECT name FROM mohurd_comp where code = ?" code
    )

(query-list mysql
       "SELECT name FROM mohurd_comp where code = ?" code
    )

(query-value mysql
       (prepare mysql "SELECT name FROM mohurd_comp where id = ?") 1
    )
|#