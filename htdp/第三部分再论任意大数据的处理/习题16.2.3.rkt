;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题16.2.3) (read-case-sensitive #t) (teachpacks ((lib "testing.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "testing.rkt" "teachpack" "htdp")) #f)))


#|
模型二: 使用结构体来表示目录

(define-struct dir (name content))

   dir is a structure
   (make-dir n c)

    name 是目录名称
    content 是一个列表包含文件和目录 a-list-of-files-and-directories (LOFD)
    LOFD 包含:
       1. empty
       2. (cons f dir)
       3. (cons dir1 dir2)
|#

#|
习题 16.2.3 说明怎样建立一个模型,其中的目录还有另外两个属性:长度和系统属性。前者测量目录本
身（不是它的文件和子目录）用去了多少空间；后者表明该目录是不是操作系统所支持的。

(make-dir n c s sys)
    n: 目录名称
    c: a list of files and directories
    s: is a number
  sys: is a boolean
|#
(define-struct dir (name content size systems))
