;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题12.3.2) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
#|https://htdp.org/2003-09-26/Solutions/draw-poly1.html
  习题 12.3.1 修改connect-dots, 它的输入还包括一个posn结构体,表示与最后一个posn想连接的点.
请使用新的connect-dots函数,修改函数draw-polygon
|#

(start 500 500)
;; 习题12.3.2 修改connect-dots,它的输入还包括一个posn结构体，
;; 表示与最后一个posn想连接的点。请使用新的connect-dots函数，修改函数draw-polygon
;;绘制多边形
;;

(define a-poly   (cons
   (make-posn 10 10)
   (cons
    (make-posn 90 100)
    (cons
     (make-posn 10 190)
     (cons
      (make-posn 190 190)
      (cons
       (make-posn 110 100)
       (cons
        (make-posn 190 10)
        empty)))))))

;; connect-dots : polygon -> true
;; 绘制 a-poly 各点之间的连线
(define (connect-dots a-poly a-posn)
  (cond
    [(empty? (rest a-poly)) (draw-solid-line (first a-poly) a-posn)]
    [else (and (draw-solid-line (first a-poly) (second a-poly) 'red)
               (connect-dots (rest a-poly) a-posn))]))




;; 画多边形
;; draw-polygon : polygon -> true
(define (draw-polygon a-poly)
  (connect-dots a-poly (first a-poly)))

(draw-polygon a-poly)

