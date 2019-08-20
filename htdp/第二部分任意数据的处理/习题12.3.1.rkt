;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题12.3.1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
#|https://htdp.org/2003-09-26/Solutions/draw-poly0.html
  习题 12.3.1 设计辅助函数add-at-end, 其将表的第一个元素加到表的末端,接着修改函数draw-polygon
|#

(define a-poly (cons (make-posn 100 90)
                    (cons (make-posn 180 180)
                          (cons (make-posn 180 100)
                                empty))))

;add-at-end : alot -> alot
(define (add-at-end alot)
  (cond
    [(empty? alot) empty]
    [else (append alot (cons (first alot) empty) )]))



;;test add-at-end
(add-at-end a-poly)


;; connect-dots : polygon -> true
;; 绘制 a-poly 各点之间的连线
(define (connect-dots a-poly)
  (cond
    [(empty? (rest a-poly)) true]
    [else (and (draw-solid-line (first a-poly) (second a-poly) 'red)
               (connect-dots (rest a-poly)))]))
;; 画多边形
;; draw-polygon : polygon -> true
(define (draw-polygon a-poly)
  (connect-dots (add-at-end a-poly)))

(start 300 300)
(draw-polygon a-poly)