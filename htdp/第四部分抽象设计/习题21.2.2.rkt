;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 习题21.2.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
|#
习题 21.2.2 使用 map 定义下列函数:
1. convert-euro,基于1.22 欧元合一美元的汇率,把美元数额的表转换成欧元数额的表;
2. convertFC,把含有华氏温度的表转换成含有摄氏温度的表;
3. move-all,输入posn 结构体的表,在每个x 成分上加上3。
#|

