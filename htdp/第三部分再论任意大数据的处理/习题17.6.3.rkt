;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.6.3) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
;;https://htdp.org/2003-09-26/Solutions/wage-general.html
#|
习题 17.6.3 在某个工厂里,员工早上到达以及晚上离开时都要打卡(用记时钟在考勤卡上打印上下班时
间)。现代化的电子考勤卡记录了员工的号码和工作时间。另外,员工记录包含员工的名字,号码和单位
工资。
开发函数 hours->wages2。该函数读入一个员工记录表和一个(电子)考勤卡表。函数对员工记录和
考勤卡中的员工号码进行匹配,计算每位员工的周工资。如果某条员工记录和(电子)考勤卡不能匹配,
或者无法匹配,函数就发出一个相应的错误信息并停止运行。假设每一位员工最多只有一张考勤卡,每个
员工号码也最多只有一张考勤卡。
提示: 会计员一般会先按照员工号码对这两个表排序。

分析结果:
员工记录包含员工的名字,号码和单位工资。
电子考勤卡记录了员工的号码和工作时间

使用两个负责输入的函数设计诀窍:
使用二维表格来处理所有情况
|#

#|
;;Data Definitions
employee-record is a structure
   (make-employee-record n i pr)
where n is a symobl and i and pr are numbers
|#
(define-struct employee-record (name id payRate))
#|
a list-of-employee-record is either
  1. empty or
  2. (cons er loer)
  where er is an employee-record and
  loer is a list-of-employee-records

punch-card is a structure
   (make-punch-card i h)
where i and h are number
|#
(define-struct punch-card (id hours))
#|
a list-of-punch-cards is either
  1. empty or
  2. (cons pc lopc)
  where pc is a punch-card and lopc is a list-of-punch-cards


a weekly-wage is a structure:
  (make-weekly-wage n w)
where n is a symbol and w is a number
|#
(define-struct weekly-wage (name pay))
#|
a list-of-weekly-wage is either
  1. empty or
  2. (cons ww loww)
  where ww is a weekly-age and loww is a list-of-wages
|#

;;CONTRACT/HEADER/PURPOSE:

;;EXAMPLE:

;;TEMPLETE:
#|
This function is used to call the sorting functions
and the hours wages function that works with sorted
lists and does not follow a template based on the data.
|#

;;hours->wages2:
;; list-of-employee-records list-of-punch-cards -> list-of-weekly-wages

(define (hours->wages2 aloer alopc)
  (hours->wages-sorted
   (sort-employee-record aloer)
   (sort-punch-cards alopc)))


;;DEFINITION:

;;TEST:
;Examples as Tests:
(check-expect 
 (hours->wages2 empty empty)
 empty)

(check-error 
 (hours->wages2 
  (list (make-employee-record 'John 495 14.35))
  empty)
 "hours->wages2: employee record and punch card do not match")

(check-error 
 (hours->wages2
  empty
  (list (make-punch-card 495 38)))
 "hours->wages2: employee record and punch card do not match")

(check-expect 
 (hours->wages2
  (list (make-employee-record 'John 495 14.35))
  (list (make-punch-card 495 38)))
 (list (make-weekly-wage 'John 545.3)))

(check-expect 
 (hours->wages2
  (list (make-employee-record 'John 495 14.35)
        (make-employee-record 'Mary 382 12.15)
        (make-employee-record 'Carol 751 15.1))
  (list (make-punch-card 495 38)
        (make-punch-card 751 32)
        (make-punch-card 382 41)))
 (list (make-weekly-wage 'Mary 498.15)
       (make-weekly-wage 'John 545.3)
       (make-weekly-wage 'Carol 483.2)))

(check-error 
 (hours->wages2
  (list (make-employee-record 'John 495 14.35)
        (make-employee-record 'Carol 751 15.1))
  (list (make-punch-card 751 32)
        (make-punch-card 495 38)
        (make-punch-card 382 41)))
 "hours->wages2: employee record and punch card do not match")

(check-error 
 (hours->wages2
  (list (make-employee-record 'John 495 14.35)
        (make-employee-record 'Mary 382 12.15)
        (make-employee-record 'Carol 751 15.1))
  (list (make-punch-card 382 41)
        (make-punch-card 751 32)))
 "hours->wages2: employee record and punch card do not match")

#|
使用两个负责输入的函数设计诀窍:
使用二维表格来处理所有情况
We need a helper function the uses sorted employee-records
and sorted punch-cards and procues a list-of-weekly-wages
:Template
(define (hours->wages-sorted aloer alopc)
 (cond
  [(and (empty? aloer) (empty? alopc)...]
  [(and (empty? aloer) (cons? alopc)
    ... (first alopc)...
    ... (rest alopc)...]
  [(and (cons? aloer) (empty? alopc))
   ... (first(aloer)...
   ... (rest aloer)...]
  [(and (cons? aloer) (cons? alopc))
    ... (calc-weekly-wage (first aloer)(first-alopc))...
    ... (hours->wage-sorted (rest aloer)(rest alopc))...]))

|#
(define (hours->wages-sorted aloer alopc)
  (cond
    [(and (empty? aloer)(empty? alopc)) empty]
    [(or (empty? aloer)(empty? alopc))
     (error 'hours->wages2
            "employee reocrd and punch card do not math")]
    [else
     (cons (calc-weekly-wage (first aloer)(first alopc))
           (hours->wages-sorted (rest aloer)(rest alopc)))]))

;Examples as Tests:
(check-expect 
 (hours->wages-sorted empty empty)
 empty)

(check-error 
 (hours->wages-sorted 
  (list (make-employee-record 'John 495 14.35))
  empty)
 "hours->wages2: employee record and punch card do not match")

(check-error 
 (hours->wages-sorted
  empty
  (list (make-punch-card 495 38)))
 "hours->wages2: employee record and punch card do not match")

(check-expect 
 (hours->wages-sorted
  (list (make-employee-record 'John 495 14.35))
  (list (make-punch-card 495 38)))
 (list (make-weekly-wage 'John 545.3)))

(check-expect 
 (hours->wages-sorted
  (list (make-employee-record 'Mary 382 12.15)
        (make-employee-record 'John 495 14.35)
        (make-employee-record 'Carol 751 15.1))
  (list (make-punch-card 382 41)
        (make-punch-card 495 38)
        (make-punch-card 751 32)))
 (list (make-weekly-wage 'Mary 498.15)
       (make-weekly-wage 'John 545.3)
       (make-weekly-wage 'Carol 483.2)))

(check-error 
 (hours->wages-sorted
  (list (make-employee-record 'John 495 14.35)
        (make-employee-record 'Carol 751 15.1))
  (list (make-punch-card 382 41)
        (make-punch-card 495 38)
        (make-punch-card 751 32)))
 "hours->wages2: employee record and punch card do not match")

(check-error 
 (hours->wages-sorted
  (list (make-employee-record 'Mary 382 12.15)
        (make-employee-record 'John 495 14.35)
        (make-employee-record 'Carol 751 15.1))
  (list (make-punch-card 382 41)
        (make-punch-card 751 32)))
 "hours->wages2: employee record and punch card do not match")

#|We need a helper function that consumer an employee-record and
a punch-card an dcalculates the weekly-wage for the employee
;template:
(define (calc-weekly-wage a-er a-pc)
  ...(employee-record-name a-er)...
  ...(employee-record-id a-er)...
  ...(employee-record-payRate a-er)...
  ...(punch-card-id a-pc)...
  ...(punch-card-hours a-pc)...)
|#
;;Contract,Purpose,Header,Definition:
;;calc-weekly-wage: employee-record punch-card -> weekly-wage
;;consumer an employee-record and a punch-card and
;;produces the weekly-wage for the employee. Produces
;;an error if the employee ids do not math.
(define (calc-weekly-wage a-er a-pc)
  (cond
    [(equal? (employee-record-id a-er)
             (punch-card-id a-pc))
     (make-weekly-wage
      (employee-record-name a-er)
      (* (employee-record-payRate a-er)
         (punch-card-hours a-pc)))]
    [else
     (error 'hours->wages2
            "employee record and punch card do not math")]))

;Examples as Tests:
(check-expect
 (calc-weekly-wage
  (make-employee-record 'John 495 14.35)
  (make-punch-card 495 38))
 (make-weekly-wage 'John 545.3))

(check-expect
 (calc-weekly-wage
  (make-employee-record 'Mary 382 12.15)
  (make-punch-card 382 41))
 (make-weekly-wage 'Mary 498.15))

(check-error 
 (calc-weekly-wage
  (make-employee-record 'Mary 382 12.15)
  (make-punch-card 495 38))
 "hours->wages2: employee record and punch card do not match")


#|
Web need a helper function that can sort a list-of-employee-records
------------------------------------------------------------------------
:Templete:
(define (sort-employee-record aloer)
 (cond
   [(empty? aloer)...]
   [else... (first aloer)...
        ... (sort-employee-record (rest aloer))...]))
|#
;;Contract,Purpose,Header,Definition:
;;sort-employee-record
;;list-of-employee-records -> list-of-employee-records(sorted)
;;to create a sorted list-of-employee-records from all the
;; employee-records in aloer
(define (sort-employee-record aloer)
  (cond
   [(empty? aloer) empty]
   [else(insert-employee-record
         (first aloer)
         (sort-employee-record (rest aloer)))]))

;Examples and Tests:
(check-expect (sort-employee-record empty)
              empty)

(check-expect 
 (sort-employee-record 
  (list (make-employee-record 'Mary 382 12.15)))
 (list (make-employee-record 'Mary 382 12.15)))

(check-expect 
 (sort-employee-record 
  (list (make-employee-record 'John 495 14.35)
        (make-employee-record 'Mary 382 12.15)
        (make-employee-record 'Carol 751 15.1)))
 (list (make-employee-record 'Mary 382 12.15)
       (make-employee-record 'John 495 14.35)
       (make-employee-record 'Carol 751 15.1)))

#|
We need helper function the insert an
employee-record in order by employee-record-d
:Templete
(define (insert-employee-record er aloer)
  (cond
   [(empty? aloer)...]
   [else
     (first aloer)...
     (insert-employee-record er (rest aloer))...]))
|#

;;Contract,Purpose,Header,Definition:
;;insert-employee-record empoyee-record list-of-employee-records(sorted)
;; -> list-of-employee-records (sorted)
;;inserts the employee-record in order into a sorted
;;list-of-employee-records
(define (insert-employee-record er aloer)
  (cond
   [(empty? aloer)(list er)]
   [else
    (cond
      [(is-before-er er (first aloer))
       (cons er aloer)]
      [else
       (cons (first aloer)
             (insert-employee-record er (rest aloer)))])]))
;Examples as Tests:
(check-expect 
 (insert-employee-record  
  (make-employee-record 'John 495 14.35) 
  empty)
 (list (make-employee-record 'John 495 14.35)))

(check-expect 
 (insert-employee-record  
  (make-employee-record 'John 495 14.35) 
  (list (make-employee-record 'Mary 382 12.15)))
 (list (make-employee-record 'Mary 382 12.15) 
       (make-employee-record 'John 495 14.35)))

(check-expect 
 (insert-employee-record  
  (make-employee-record 'John 495 14.35) 
  (list (make-employee-record 'Carol 751 15.1)))
 (list (make-employee-record 'John 495 14.35) 
       (make-employee-record 'Carol 751 15.1)))

(check-expect 
 (insert-employee-record  
  (make-employee-record 'John 495 14.35) 
  (list (make-employee-record 'Mary 382 12.15) 
        (make-employee-record 'Carol 751 15.1)))
 (list (make-employee-record 'Mary 382 12.15) 
       (make-employee-record 'John 495 14.35) 
       (make-employee-record 'Carol 751 15.1)))

#| We need a helper function that consumers two
employee-records and reports if the first
employee-reocrd should come before the second
------------------------------------------------
;Templete:
(define (is-before-er a-er another-er)
  ...(employee-record-name a-er)...
  ...(employee-reocrd-id a-er)...
  ...(employee-record-payRate a-er)...
  ...(employee-record-name another-er)...
  ...(employee-record-id another-er)...
  ...(employee-record-payRate another-er)...)
|#

;;Contract,Purpose,Header,Definition:
;;is-before-er: employee-record employee-record -> boolean
;;consumes two employee-record and retures ture if the
;;first employee-record should come before the second
;;in an orderd list of employee-records
(define (is-before-er a-er another-er)
  (< (employee-record-id a-er)
     (employee-record-id another-er)))
;Examples as Tests:
(check-expect
 (is-before-er 
  (make-employee-record 'John 495 14.35) 
  (make-employee-record 'Carol 751 15.1))
 true)

(check-expect
 (is-before-er     
  (make-employee-record 'Carol 751 15.1)
  (make-employee-record 'John 495 14.35))
 false)

#|We need a helper funtion the can
sort a list-of-punch-cards
---------------------------------------
;Templete:
(define (sort-punch-cards alopc)
  (cond
    [(empty? alopc) ...]
    [else ... (first alopc)...
          ... (sort-punch-cards (rest alopc)...]))
|#
;;Contract,Purpose,Header,Definition
;;sort-punch-cards:
;; list-of-punch-cards ->  list-of-punch-cards (sortd)
;; to create a sorted list-of-punch-cards from all the
;; punch-cards in alopc
(define (sort-punch-cards alopc)
  (cond
    [(empty? alopc) empty]
    [else (insert-punch-cards
           (first alopc)
           (sort-punch-cards (rest alopc)))]))

#|We need a helper function that inserts a
punch-card in order by punch-card-id
----------------------------------------
;Templete:
(define (insert-punch-cards pc alopc)
  (cond
    [(empty? alopc)...]
    [else ... (first alopc)...
          ... (insert-punch-cards pc (rest alopc))...]))

|#
;;insert-punch-cards:
;; punch-card list-of-punch-cards (sortd)
;; -> list-of-punch-cards (sortd)
;; inserts the punch-card in order into a sorted
;; list-of-punch-cards
(define (insert-punch-cards pc alopc)
  (cond
    [(empty? alopc) (list pc)]
    [else
     (cond
       [(is-before-pc pc (first alopc))
        (cons pc alopc)]
       [else
        (cons (first alopc)
              (insert-punch-cards pc (rest alopc)))])]))

#| We need a helper functio the consumer two
punch-cards an dreports if the first punch-card should come before the secodn
-------------------
;templete:
(define (is-before-pc a-pc another-pc)
  ...(punch-card-id a-pc)...
  ...(punch-card-hours a-pc)...
  ...(punch-card-id another-pc)...
  ...(punch-card-hours another-pc)..))
|#
;;Contract,Purpose,Header,Definition:
;;is-before-pc: punch-card punch-card -> boolean
;;consumes two punch-cards and reports if the first
;;punch-card should come before the second in a
;;list of sorted punch-cards
(define (is-before-pc a-pc another-pc)
  (< (punch-card-id a-pc)
     (punch-card-id another-pc)))

