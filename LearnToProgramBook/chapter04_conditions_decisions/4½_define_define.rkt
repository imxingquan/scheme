#lang racket

#|

Module-Level Definitions

   1. Variable definitions
   2. Function definitions


Local Definitions

|#

;variable definitions example
(define HEIGHT 0)
(define WIDTH 200)

(unless (> HEIGHT 0)
  (error 'my-error "HEIGHT may not be negative"))



;function definitions example
(define SQR-COLOR "red")
(define SQR-SIZE 10)
(define (draw-square img x y)
  (place-image (square SQR-SIZE "solid" SQR-COLOR)
               x y
               img))


;local definitions
(struct posn (x y))
(struct rectangle (width height))
(define (inside-of-rectangle? r p)
  (define x (posn-x p))
  (define y (posn-y p))
  (define width (rectangle-width r))
  (define height (rectangle-height r))
  (and (<= 0 x) (< x width) (<= 0 y) (< y height)))


