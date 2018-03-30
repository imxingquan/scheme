#lang racket
(require db)
(define mydb
  (mysql-connect #:server "127.0.0.1"
                 #:port 3306
                 #:database "bzProject"
                 #:user "root"
                 #:password "root"))

(define r (second (query-rows mydb "select name,censor_State from bz_user")))