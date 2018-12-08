;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname |12.3 绘制多边形|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #t ((lib "image.rkt" "teachpack" "2htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(start 500 500)

;;绘制多边形
;;

(define a-poly (cons (make-posn 100 100)
                    (cons (make-posn 180 180)
                          (cons (make-posn 180 100)
                                empty))))


;; connect-dots : polygon -> true
;; 绘制 a-poly 各点之间的连线
(define (connect-dots a-poly)
  (cond
    [(empty? (rest a-poly)) true]
    [else (and (draw-solid-line (first a-poly) (second a-poly) 'red)
               (connect-dots (rest a-poly)))]))


;; last : polygon -> posn
;; 提取 a-poly 的最后一个posn
(define (last a-poly)
  (cond
    [(empty? (rest a-poly)) (first a-poly)]
    [else (last (rest a-poly))]))

;; 画多边形
;; draw-polygon : polygon -> true
(define (draw-polygon a-poly)
  (connect-dots (cons (last a-poly) a-poly)))

(draw-polygon a-poly)