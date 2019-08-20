;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.3.1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 14.3.1 简要地说明如何使用模板和例子定义 size。使用前述的例子对 size 进行测试。
|#

(define wp1 '(The TeachScheme! Project aims to improve the 
 problem-solving and organization skills of high 
 school students. It provides software and lecture 
 notes as well as exercises and solutions for teachers.) )

(define wp2 '(The TeachScheme Web Page 
 Here you can find: 
 (LectureNotes for Teachers) 
 (Guidance for (DrScheme: a Scheme programming environment)) 
 (Exercise Sets) 
 (Solutions for Exercises) 
 For further information: write to scheme@cs last word))


#|
 FUNC TMPL
 size : WP -> number
 计算在 a-wp中出现的符号数

(define (size a-wp)
  (cond
    [(empty? a-wp)...]
    [(symbol? (first a-wp)) ...(first a-wp) ... (size (rest a-wp))...]
    [else ... (size (first a-wp)... (size (rest a-wp)))]))
|#

(define (size a-wp)
  (cond
    [(empty? a-wp) 0 ]
    [(symbol? (first a-wp)) (+ 1 (size (rest a-wp)))]
    [else (+ (size (first a-wp)) (size (rest a-wp)))]))

;;test

(size wp1)
;output 29
(size wp2)
;output 31
