;; # Exercise 1.12
;;
;; > The following pattern of numbers is called "Pascal's triangle":
;; >
;; >             1
;; >           1   1
;; >         1   2   1
;; >       1   3   3   1
;; >     1   4   6   4   1
;; >
;; > The numbers at the edge of the triangle are all 1, and each number
;; > inside the triangle is the sum of the two numbers above it.(4)
;; > Write a procedure that computes elements of Pascal's triangle by
;; > means of a recursive process.

(define (binomial-coef n m)
  (cond
   ((= m 1) 1)
   ((= n m) 1)
   (else
    (+ (binomial-coef (- n 1) (- m 1))
       (binomial-coef (- n 1) m)))))
