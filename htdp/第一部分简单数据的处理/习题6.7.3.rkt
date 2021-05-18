;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname 习题6.7.3) (read-case-sensitive #t) (teachpacks ((lib "hangman.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "hangman.rkt" "teachpack" "htdp")) #f)))
#|
习题 6.7.3 设计函数 reveal,该函数读入三个参数:
1. chosen,要猜测的单词;
2. status , 状态单词,表示单词的那些部分已经被猜中;
3. 一个字符, 当前的猜测。
函数返回一个新的状态单词,即,包含通常字符和'_的单词。比较当前的猜测和被猜测单词的每个字符,
从而求出新的状态单词的值:
1. 如果当前猜测等于被猜测单词的某个字符,用前猜测代替新状态单词中的相应字符;
2. 否则,状态单词不变。
使用下列例子对函数进行测试:
(reveal (make-word 't 'e 'a) (make-word '_ 'e '_) 'u)
;; 预期值:
(make-word '_ 'e '_)
(reveal (make-word 'a 'l 'e) (make-word 'a '_ '_) 'e)
;; 预期值:
(make-word 'a '_ 'e)
(reveal (make-word 'a 'l 'l) (make-word '_ '_ '_) 'l)
;; 预期值:
(make-word '_ 'l 'l)
第一个例子是当前猜测与被猜单词不符,第二个例子是当前猜测在被猜单词出现,最后一个例子是当
前猜测在被猜单词出现两次。
提示:(1)当一个定义变得较大而难以管理的时候,使用辅助函数;(2) 函数reveal 读入两个结构体和一个
字符,这提示我们使用复合数据的设计诀窍。对于模板,最好是将选择表达式写成两列,每列对应于一个
结构体。
当函数 draw-next-part 、draw-next-par 和reveal 被完全测试之后,在DrScheme 中将teachpack 设置为
hangman.ss,并计算
(hangman make-word reveal draw-next-part)
其中函数hangman 随机选择一个包含3 个字母的单词,弹出一个字符菜单,用户可以选择一个字符,按下
Check 按钮看是否猜对。将练习6.7.1 中的测试注释掉,使绘制图形的效果不影响这里hangman 函数的运
行。
|#


;Data definition
(define-struct word (first second third))
;; A word is a structure: (make-word letter letter letter)

;;CONTRACT/HEADER/PURPOSE:
;; reveal word word letter -> word
;; to apply compare guess with chosen and status for each position
;;(define (reveal chosen status guess)...)

;; EXAMPLE:
;; Given: (make-word 'd 'e 'r) (make-word '_ '_ '_) 'd
;;   reveal should produce (make-word 'd '_ '_)
;; Given: (make-word 'd 'e 'r) (make-word '_ '_ '_) 'f
;;   reveal should produce (make-word '_ '_ '_)

;; TEMPLETE:
#|
(define (reveal chosen status guess)
  ... (word-first chosen)...(word-first status)
  ... (word-second chosen)...(word-second status)
  ... (word-third chosen)...(word-third status)...)

|#

;; DEFINITION:
(define (reveal chosen status guess)
  (make-word (reveal1 (word-first chosen) (word-first status) guess)
             (reveal1 (word-second chosen) (word-second status) guess)
             (reveal1 (word-third chosen) (word-third status) guess)))


;; AUXILIARY PROGRAM: 
;; CONTRACT/HEADER/PURPOS
;; reveal1 : l l l -> l
;; to pick ch if ch = st, gu if ch = gu,and st otherwise
;;(define (reveal1 ch st gu)...)

;; EXAMPLES:
;; reveal1: 'a 'a 'x => 'a
;; reveal1: 'x '_ 'x => 'x
;; reveal1: 'x '_ 'y => '_

;; DEFINITION:
(define (reveal1 ch st gu)
  (cond
    [(eq? ch st) ch]
    [(eq? ch gu) gu]
    [else st]))

;; TESTS:
(reveal1 'a 'a 'x)
(reveal1 'x '_ 'x)
(reveal1 'x '_ 'y)

(reveal (make-word 'd 'e 'r)
        (make-word '_ '_ '_)
        'd)
(reveal (make-word 'd 'e 'r)
        (make-word '_ '_ 'f)
        'f)


;; TEST:
;; draw-next-part : symbol -> true
;; consumes one of the seven body-part symbols and draws that part.

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
     (and       
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
                       'black))]
    [(eq? body-part 'noose)
     (and
      (draw-solid-line (make-posn 100 30)
                       (make-posn 100 10)
                       'black)
      (draw-solid-line (make-posn 100 10)
                       (make-posn 0 10)
                       'black))]))

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

;; uncomment to play the game
(start 200 200)
(hangman make-word reveal draw-next-part)