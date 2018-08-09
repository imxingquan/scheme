#lang racket
(require graphics/graphics)
;;init graphics
(open-graphics)

;;定义是2象限还是4象限
;;2象限原点在左下角,4象限原点在中间
(define is-quadrant4 true)

;;定义画布大小
(define view-width 900)
(define view-height 800)
(define viewport (open-viewport "X-Y AXIS" view-width view-height))

;;定义刻度线的长度
(define scale-len 5)
;;定义XY轴长
(define gap 20)

;;定义坐标系的原点
(define origin 
  (cond
    [is-quadrant4 (make-posn (/ view-width 2) (/ view-height 2))]
    [else (make-posn 50 (- view-height 50))]))

(define origin-x (posn-x origin))
(define origin-y (posn-y origin))

;;定义x,y轴长度
(define x-axis-len
  (cond
    [is-quadrant4 (/ view-width 2)]
    [else (- view-width origin-x)]))
(define y-axis-len
  (cond
    [is-quadrant4 (/ view-height 2)]
    [else origin-y]))


;;每等份的长度
(define gap-len (/ x-axis-len gap))



;;定义画线函数
;;start :posn 起点坐标
;;end :posn 终点坐标
(define (draw-line0 start end [color "red"])
  ((draw-line viewport) start end color))


;;正坐标系xy的终点
(define x-axis-end-pos (make-posn (+ origin-x x-axis-len) origin-y))
(define y-axis-end-pos (make-posn origin-x (- origin-y y-axis-len)))

;;负轴坐标系xy的终点
(define x-axis-end-pos0 (make-posn (- origin-x x-axis-len) origin-y))
(define y-axis-end-pos0 (make-posn origin-x (+ origin-y y-axis-len)))

;;画轴线
(draw-line0 origin x-axis-end-pos)
(draw-line0 origin y-axis-end-pos)
;;如果是4象限画负轴
(cond
  [is-quadrant4
    (draw-line0 origin x-axis-end-pos0)
     (draw-line0 origin y-axis-end-pos0)])

;画刻度
;画1个X轴的刻度
;;dest-from-origin : 距离原点的位置
(define (draw-xAxis-scale0 dest-from-origin)
  (define k1 (make-posn (+ origin-x dest-from-origin) origin-y))
  (define k2 (make-posn  (+ origin-x dest-from-origin) (- origin-y scale-len)))
  (draw-line0 k1 k2))
;画1个Y轴的刻度
;dest-from-origin : 距离原点的位置
(define (draw-yAxis-scale0 dest-from-origin)
  (define k1 (make-posn origin-x (- origin-y dest-from-origin)))
  (define k2 (make-posn (+ origin-x scale-len) (- origin-y dest-from-origin)))
  (draw-line0 k1 k2))
;画1个负X轴的刻度
(define (draw-xAxis-scale1 dest-from-origin)
  (define k1 (make-posn (- origin-x dest-from-origin) origin-y))
  (define k2 (make-posn  (- origin-x dest-from-origin) (- origin-y scale-len)))
  (draw-line0 k1 k2))
;画1个负Y轴的刻度
(define (draw-yAxis-scale1 dest-from-origin)
  (define k1 (make-posn origin-x (+ origin-y dest-from-origin)))
  (define k2 (make-posn (+ origin-x scale-len) (+ origin-y dest-from-origin)))
  (draw-line0 k1 k2))

;;
(define (draw-axis-scale skip)
  (cond
    [(< skip x-axis-len)
     (draw-xAxis-scale0 skip)
     (draw-yAxis-scale0 skip)
     (cond
       [is-quadrant4
         (draw-xAxis-scale1 skip)
         (draw-yAxis-scale1 skip)
        ])
     (draw-axis-scale (+ skip gap-len))]
    [else void]))

(draw-axis-scale 0)