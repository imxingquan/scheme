;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.3.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#| https://htdp.org/2003-09-26/Solutions/web2.html
习题 14.3.2 开发函数 occurs1,该函数读入一个网页和一个符号,返回该符号在网页中出现的次数,忽略
嵌入的网页。
开发函数 occurs2，该函数类似于 occurs1，但是它计算该符号所有的出现次数，包括在嵌入网页中的
出现。
|#

(define wp1 '(The TeachScheme! Project aims to improve the 
 problem-solving and organization skills of high 
 school students. It provides software and lecture 
 notes as well as exercises and solutions for teachers.) )

(define wp2 '(The TeachScheme a Web Page 
 Here you can find: 
 (LectureNotes for Teachers) 
 (Guidance for (DrScheme: a Scheme programming environment)) 
 (Exercise Sets) 
 (Solutions for Exercises) 
 For a further information: write to scheme@cs last word))




;;occurs1 : a-wp a-symbol -> number
;;a-wp 网页. a-symbol 符号
;;返回符号在网页中出现的次数, 忽略嵌入的网页
;;FUN TMPL
#|
(define (fun a-wp)
  (cond
    [(empty? a-wp)...]
    [(symbol? (first a-wp)) ...(first a-wp) ... (size (rest a-wp))...]
    [else ... (size (first a-wp)... (size (rest a-wp)))]))
|#
(define (occurs1 a-wp a-symbol)
  (cond
    [(empty? a-wp) 0]
    [(and (symbol? (first a-wp))
          (eq? (first a-wp) a-symbol))
     (+ 1 (occurs1 (rest a-wp) a-symbol))]
    [else (occurs1 (rest a-wp) a-symbol)]))

;;test
(occurs1 wp1 'as)
;output: 2
(occurs1 wp2 'a)
;output: 2

(= (occurs1 empty 'a) 0)
(= (occurs1 '(a b a) 'a) 2)
(= (occurs1 '((a b c) b (a a a) a) 'a) 1)



(define (occurs2 a-wp a-symbol)
  (cond
    [(empty? a-wp) 0]
    [(symbol? (first a-wp))
     (cond
       [(symbol=? (first a-wp) a-symbol) (+ 1 (occurs2 (rest a-wp) a-symbol))]
       [else (occurs2 (rest a-wp) a-symbol)]
       )]
    [else (+ (occurs2 (first a-wp) a-symbol) (occurs2 (rest a-wp) a-symbol))]))

(= (occurs2 empty 'a) 0)
(= (occurs2 '(a b a) 'a) 2)
(= (occurs2 '((a b c) b (a a a) a) 'a) 5)
;;output: 3