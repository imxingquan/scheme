#lang racket
(require srfi/1)

(reduce + 0 (range 0 10 2))