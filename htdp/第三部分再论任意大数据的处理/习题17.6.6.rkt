;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.6.6) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
#| 17.6.6 DNAprefix
--------------------------------------
;Data Definition:
a list-of-symbols is either
  1. empty or
  2. (cons s los)
  where s is a symbol and los is a list-of-symbols

;Templete:
(define (DNAprefix pattern search-string)
  (cond
   [(and (empty? pattern) (empty? search-string))...]
   [(and (empty? pattern) (cons? search))
      ...(first search-string)...(rest search-string)...]
   [(and (cons? pattern) (empty? search-string))
      ...(first pattern)...(first search-string)...]
   [(and (cons? pattern) (cons? search-string))
      ...(first pattern)...(first search-string)...
      ...(DNAprefix (rest pattern) search-string)...
      ...(DNAprefix pattern (rest search-string))...
      ...(DNAprefix (rest pattern) (rest search-string))...]))

|#

;;DNAprefix: list-of-symbols list-of-symbols -> true or false
;;consumes two lists of symbols. the first list if called a pattern,
;;the second one a search-string. the function returns true if the pattern is a prefix
;;of the search-string. In all other cases, the fucntion returns flase.
(define (DNAprefix pattern search-string)
  (cond
    [(empty? pattern) true]
    [(empty? search-string) false]
    [else
     (and (symbol=? (first pattern) (first search-string))
          (DNAprefix (rest pattern) (rest search-string)))]))

;Examples as Tests:
(check-expect
 (DNAprefix empty 
            empty)
 true)

(check-expect
 (DNAprefix empty 
            (list 'a 't))
 true)

(check-expect
 (DNAprefix (list 'a 't 'c)
            empty)
 false)

(check-expect
 (DNAprefix (list 'a 't) 
            (list 'a 't))
 true)

(check-expect
 (DNAprefix (list 'a 't)
            (list 'a 't 'c 'g))
 true)

(check-expect
 (DNAprefix (list 'a 't 'c)
            (list 'a 't))
 false)

(check-expect
 (DNAprefix (list 'a 'c)
            (list 'a 't))
 false)
