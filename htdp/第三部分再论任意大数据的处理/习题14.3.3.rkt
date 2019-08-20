;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.3.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|https://htdp.org/2003-09-26/Solutions/web3.html
习题 14.3.3 开发函数 replace,该函数读入符号 new 和 old,以及网页 a-wp,返回一个网页,该网页在结
构上和 a-wp 相同，但其中所有 old 的出现都被替换成 new
|#
(define wp1 '(The TeachScheme! Project aims to improve the 
 problem-solving and organization skills of high 
 school students. It provides software and lecture 
 notes as well as exercises and solutions for teachers.) )

(define wp2 '(The TeachScheme a Web Page $a
 Here you can find: 
 (LectureNotes for Teachers $a) 
 (Guidance $a for (DrScheme: a Scheme programming environment $a)) 
 (Exercise $a Sets) 
 (Solutions for Exercises $a) 
 For a further information: $a write to scheme@cs last word))


#|
(define (fun a-wp)
  (cond
    [(empty? a-wp)...]
    [(symbol? (first a-wp)) ...(first a-wp) ...  (rest a-wp)...]
    [else ... (fun (first a-wp)... (fun (rest a-wp)))]))
|#
;; replace new old a-wp -> a-wp
;; 替换网页中的符号
;;

(define (replace new old a-wp)
  (cond
    [(empty? a-wp) empty]
    [(symbol? (first a-wp)) (cons (repl0 new old (first a-wp)) (replace new old (rest a-wp)))]
    [else (cons (replace new old (first a-wp)) (replace new old (rest a-wp)))]))


(define (repl0 new old value)
  (cond
    [(symbol=? value old) new]
    [else value]))

(repl0 'TO 'to 'to)

(replace 'TT 'to wp1)
(replace '@@ '$a wp2)