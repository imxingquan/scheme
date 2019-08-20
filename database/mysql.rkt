#lang racket
(require db)
(mysql-connect #:server "127.0.0.1"
               #:port 3306
               #:database "db1"
               #:user "root"
               #:password "root"
               #:ssl 'no)
