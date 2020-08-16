;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题17.6.2) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
;;https://htdp.org/2003-09-26/Solutions/hangman-list.html

 (require htdp/hangman)
;; contract/header/puropse
; (define (reveal-list lst-of-word lst-of-status l)...)

;; Example
;; Given (reveal-list (list 't 'e 'a) (list '_ 'e '_) 'u)
;;    reveal-list should produce (list '_ 'e '_)
;; Given (reveal-list (list 'a 'l 'e) (list 'a '_ '_) 'e)
;;    reveal-list should  (list 'a '_ 'e)
;; Given (reveal-list (list 'a 'l 'l) (list '_ '_ '_) 'l)
;;    reveal-list showld produce (list '_ 'l 'l)

#|
;Data Definition:
a word is either
 1. empty
 2. (cons 1 w)
 where l is a letter and w is a word
|#

;; TEMPLETE
#|
 处理复杂的输入将其中一个当作原子处理

 (define (reveal-list chosen status guess)
   (cond
     [(empty? chosen)...]
     [else ... (first chosen)...(first status)...
           ... (reveal-list (rest chosen) status guess)...
           ... (reveal-list (chosen (rest status) guess)...
           ... (reveal-list (rest chosen)(rest status) guess)...]))

|#


;; Definitions
;;reveal-list word word letter -> word
;; 1. the chosen word 我们将要猜测的单词
;; 2. the status word, which satus how much of the word we have guessed so far; 到目前位置我们才对的单词
;; 3. a letter, which is our current guess.

(define (reveal-list chosen status guess)
  (cond
    [(empty? chosen) empty]
    [else
     (cond
       [(equal? (first chosen)  guess)
        (cons guess
              (reveal-list (rest chosen) (rest status) guess))]
       [else
        (cons (first status)
              (reveal-list (rest chosen)(rest status) guess))])]))

;Tests:
(check-expect 
 (reveal-list (list 't 'e 'a) (list '_ 'e '_) 'u)
 (list '_ 'e '_))

(check-expect 
 (reveal-list (list 'a 'l 'e) (list 'a '_ '_) 'e)
 (list 'a '_ 'e))

(check-expect 
 (reveal-list (list 'a 'l 'l) (list '_ '_ '_) 'l)
 (list '_ 'l 'l))

;;draw-next-part from 6.7.1
;;draw-next-part : symbol -> true
;;consumes one of the seven body-part 
;;symbols and draws that part.

#|
;; TEMPLATE
(define (draw-next-part body-part)
  (cond
    [(eq? body-part 'body) ...]
    [(eq? body-part 'right-leg) ...]
    [(eq? body-part 'left-leg) ...]
    [(eq? body-part 'right-arm) ...]
    [(eq? body-part 'left-arm) ...]
    [(eq? body-part 'head) ...]
    [(eq? body-part 'noose) ...]))
|#

(define (draw-next-part body-part)
  (cond 
    [(eq? body-part 'body)
     (draw-solid-line (make-posn 100 60)
                      (make-posn 100 130)
                      'black)]
    [(eq? body-part 'right-leg)
     (draw-solid-line (make-posn 100 130)
                      (make-posn 30 170)
                      'black)]
    [(eq? body-part 'left-leg)
     (draw-solid-line (make-posn 100 130)
                      (make-posn 170 170)
                      'black)]
    [(eq? body-part 'right-arm)
     (draw-solid-line (make-posn 100 75)
                      (make-posn 40 65)
                      'black)]
    [(eq? body-part 'left-arm)
     (draw-solid-line (make-posn 100 75)
                      (make-posn 160 65)
                      'black)]
    [(eq? body-part 'head)
     (draw-circle (make-posn 100 50) 10 'black)]
    [(eq? body-part 'noose)
     (and
      (draw-solid-line (make-posn 100 30)
                       (make-posn 100 10)
                       'black)
      (draw-solid-line (make-posn 100 10)
                       (make-posn 0 10)
                       'black)     
      (draw-solid-disk (make-posn 120 50) 30 'red)
      (draw-solid-line (make-posn 115 35)
                       (make-posn 123 43)
                       'black)
      (draw-solid-line (make-posn 123 35)
                       (make-posn 115 43)
                       'black)
      (draw-solid-line (make-posn 131 40)
                       (make-posn 139 48)
                       'black)
      (draw-solid-line (make-posn 139 40)
                       (make-posn 131 48)
                       'black))]))
#|
;; TESTS
(start 200 200)
(draw-next-part 'noose)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)
(draw-next-part 'left-arm)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)
(draw-next-part 'left-arm)
(draw-next-part 'right-leg)

(start 200 200)
(draw-next-part 'noose)
(draw-next-part 'head)
(draw-next-part 'body)
(draw-next-part 'right-arm)
(draw-next-part 'left-arm)
(draw-next-part 'right-leg)
(draw-next-part 'left-leg)
|#

(check-expect (start 200 200) true)
(check-expect (hangman-list reveal-list draw-next-part) true)