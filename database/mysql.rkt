#lang racket
(require db)
(define mysql
  (mysql-connect #:server "127.0.0.1"
                 #:port 3306
                 #:database "ikucc_db"
                 #:user "root"  	
                 #:password "root"   
                 #:ssl 'no))

(define code "91371122680698958N")

(query mysql
       "SELECT name FROM mohurd_comp where code = ?" code
    )

(query-list mysql
       "SELECT name FROM mohurd_comp where code = ?" code
    )

(query-value mysql
       (prepare mysql "SELECT name FROM mohurd_comp where id = ?") 1
    )