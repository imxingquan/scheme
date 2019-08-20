;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname 习题13.1.6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
#|
习题 13.1.6 在必要的地方恢复 list 以及引号的使用:
1. 
'(1 a 2 b 3 c) 
2. 
'((alan 1000) 
 (barb 2000) 
 (carl 1500)
 (dawn 2300)) 
3. 
'((My First Paper) 
 (Sean Fisler) 
 (Section 1 
 (Subsection 1 Life is difficult) 
 (Subsection 2 But learning things makes it interesting)) 
 (Section 2 
 Conclusion? What conclusion?)) 
|#

'(1 a 2 b 3 c)
(list 1 'a 2 'b 3 'c)

'((alan 1000) 
 (barb 2000) 
 (carl 1500)
 (dawn 2300))
(list (list 'alan 1000)
      (list 'barb 2000)
      (list 'carl 1500)
      (list 'dawn 2300))

'((My First Paper) 
 (Sean Fisler) 
 (Section 1 
 (Subsection 1 Life is difficult) 
 (Subsection 2 But learning things makes it interesting)) 
 (Section 2 
 Conclusion? What conclusion?))

(list (list 'My 'First 'Paper)
      (list 'Sean 'Fisler)
      (list 'Section 1
            (list 'Subsection 1 'Life 'is 'difficult)
            (list 'Subsection 2 'But 'learning 'things 'makes 'it 'interesting))
      (list 'Section 2 'Conclusion? 'What 'conclusion?)) 