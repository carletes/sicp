;; *Exercise 1.3:* Define a procedure that takes three numbers as
;; arguments and returns the sum of the squares of the two larger
;; numbers.

(define (sum-of-squares x y)
  (+ (* x x) (* y y)))

(define (sum-of-squares-of-two-larger x y z)
  (cond
   ((> x y)
    (cond
     ((> y z) (sum-of-squares x y))
     (else (sum-of-squares x z))))
   ((> x z) (sum-of-squares x y))
   (else (sum-of-squares y z))))

;; scheme@(guile-user)> (sum-of-squares-of-two-larger 1 2 3)
;; $5 = 13
;; scheme@(guile-user)> (sum-of-squares-of-two-larger 2 1 3)
;; $6 = 13
;; scheme@(guile-user)> (sum-of-squares-of-two-larger 2 3 1)
;; $7 = 13
;; scheme@(guile-user)> (sum-of-squares-of-two-larger 3 2 1)
;; $8 = 13
;; scheme@(guile-user)> (sum-of-squares-of-two-larger 3 1 2)
;; $9 = 13
;; scheme@(guile-user)> (sum-of-squares-of-two-larger 1 3 2)
;; $10 = 13
