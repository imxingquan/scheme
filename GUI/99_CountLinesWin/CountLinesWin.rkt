#lang racket
(require racket/gui)
(require "count-file-lines.rkt")


(define file-ext #t)

(define frame (new frame% [label "Example"][ width 800] [height 600]))

(define editor-canvas (new editor-canvas% 
                           (parent frame) 
                           (label "Editor Canvas"))) 
(define text (new text%))

(define menu-bar (new menu-bar% 
                      (parent frame))) 
(define menu-file
  (new menu% 
     (label "&File") 
     (parent menu-bar)))

(new menu-item%
     (label "&Open Directory")
     (parent menu-file)
     (callback (lambda (obj event)
                 (define path (get-directory))
                 (send text erase)
                 (define sum-str (sum-line path file-ext (lambda (x)
                                       (printf "~a" x)
                                       (send text insert x) 
                                       )))
                 (send text insert sum-str)

                 )))

(define menu-file-ext (new menu% 
     (label "&File Ext") 
     (parent menu-bar)))
(define menu-file-ext-java (new checkable-menu-item%
     (label "&Java File")
     (parent menu-file-ext)
     (callback (lambda (obj event)
                
                 (define is-java-file (send obj is-checked?))
                 (if is-java-file
                      (set! file-ext ".java")
                      (set! file-ext #t))
                 (println file-ext)
                 
                 ))))


(send text insert "计算代码行数") 
(send editor-canvas set-editor text) 

;(play-sound "C:/Windows/media/Ring05.wav" #t)
(send frame show #t)

