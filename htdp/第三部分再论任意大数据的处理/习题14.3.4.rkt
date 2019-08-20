;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题14.3.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|https://htdp.org/2003-09-26/Solutions/web4.html

习题 14.3.4 人们并不喜欢深层的网页,因为要在这种网页中寻找有用的信息需要进行太多的网页切换。
因为这个原因，网页设计者还需要测量某个网页的深度。只包含符号的网页的深度为 0；包含一个直接嵌
入页的网页深度为该嵌入页的深度加 1。如果某个网页包含多个直接嵌入页，它的深度就是最深的嵌入页
深度加 1。开发 depth，该函数读入一个网页，计算它的深度
|#

#|
(define (fun a-wp)
  (cond
    [(empty? a-wp)...]
    [(symbol? (first a-wp)) ...(first a-wp) ...  (rest a-wp)...]
    [else ... (fun (first a-wp)... (fun (rest a-wp)))]))
|#
(define (depth a-wp)
  (cond
    [(empty? a-wp) 0]
    [(symbol? (first a-wp)) (depth (rest a-wp))]
    [else (max (+ (depth (first a-wp)) 1)
               (depth (rest a-wp)))]))

(depth '(a b c)) ;=> 0
(depth '(a (b c) d (e f))); => 2
(depth '(a (b (c (d))) e (f (g (h))))) ;=> 3
(depth '(a (b (c d)) e (f (g h (i j (k)))))) ;=>4

