;; # Exercise 1.7
;;
;; > The `good-enough?` test used in computing square
;; > roots will not be very effective for finding the square roots of
;; > very small numbers.  Also, in real computers, arithmetic operations
;; > are almost always performed with limited precision.  This makes
;; > our test inadequate for very large numbers.  Explain these
;; > statements, with examples showing how the test fails for small and
;; > large numbers.
;;
;; We will use `sqrt-original` as the name of our square root function, so that
;; we may compare it with the `sqrt`:

(define (sqrt-original x)
  (sqrt-iter 1.0 1.0 x good-enough-original?))

;; (This is cheating a bit, since the fact that procedures are also values has
;; not been mentioned yet in the text).
;;
;; We have parametrized the `good-enough?` check, so that we may compare later
;; with an alternative definition:

(define (sqrt-iter guess prev-guess x good-enough-p)
  (if (good-enough-p guess prev-guess x)
      guess
      (sqrt-iter (improve guess x)
		 guess
		 x
		 good-enough-p)))

;; The helper functions remain the same as in the original text:

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

;; We define now a function to measure the error of `sqrt`:

(define (sqrt-error sqrt-func x)
  (abs (- (square (sqrt-func x))
	  x)))

;; With the original `good-enough?`, the error for values below our tolerance
;; are larger than the value itself:

(define (good-enough-original? guess prev-guess x)
  (< (abs (- (square guess) x)) 0.001))

;;     scheme@(guile-user)> (sqrt-error sqrt-original 1e-4)
;;     $2 = 9.438358335233747e-4
;;     scheme@(guile-user)> (sqrt-error sqrt-original 1e-5)
;;     $3 = 9.732294718753642e-4
;;     scheme@(guile-user)> (sqrt-error sqrt-original 1e-6)
;;     $4 = 9.762285838805523e-4
;;     scheme@(guile-user)>
;;
;; The built-in `sqrt` function does not show this behaviour:
;;
;;     scheme@(guile-user)> (sqrt-error sqrt 1e-4)
;;     $5 = 0.0
;;     scheme@(guile-user)> (sqrt-error sqrt 1e-5)
;;     $6 = 0.0
;;     scheme@(guile-user)> (sqrt-error sqrt 1e-6)
;;     $7 = 0.0
;;     scheme@(guile-user)>
;;
;; For large numbers, the error is also larger with our `sqrt-f`:
;;
;;     scheme@(guile-user)> (sqrt-error sqrt-original 1e4)
;;     $8 = 5.098148722026963e-5
;;     scheme@(guile-user)> (sqrt-error sqrt-original 1e5)
;;     $9 = 2.246262738481164e-6
;;     scheme@(guile-user)> (sqrt-error sqrt-original 1e6)
;;     $10 = 2.3632310330867767e-8
;;     scheme@(guile-user)>
;;
;;     scheme@(guile-user)> (sqrt-error sqrt 1e6)
;;     $11 = 0.0
;;     scheme@(guile-user)> (sqrt-error sqrt 1e5)
;;     $12 = 1.4551915228366852e-11
;;     scheme@(guile-user)> (sqrt-error sqrt 1e4)
;;     $13 = 0.0
;;     scheme@(guile-user)>
;;
;; > An alternative strategy for implementing `good-enough?` is to watch how
;; > `guess` changes from one iteration to the next and to stop when the change
;; > is a very small fraction of the guess.  Design a square-root procedure
;; > that uses this kind of end test.  Does this work better for small and large
;; > numbers?

(define (good-enough-improved? guess prev-guess x)
  (< (abs (- guess prev-guess))
     (* guess 1e-4)))

(define (sqrt-improved x)
  (sqrt-iter 1.0 0.0 x good-enough-improved?))

;; The error for small values is now better:
;;
;;     scheme@(guile-user)> (sqrt-error sqrt-improved 1e-4)
;;     $14 = 5.09814860141268e-13
;;     scheme@(guile-user)> (sqrt-error sqrt-improved 1e-5)
;;     $15 = 2.246246672823679e-16
;;     scheme@(guile-user)> (sqrt-error sqrt-improved 1e-6)
;;     $16 = 2.3505164286306834e-20
;;     scheme@(guile-user)>
;;
;; For large values the error decreases, too, but to a lesser degree:
;;
;;     scheme@(guile-user)> (sqrt-error sqrt-improved 1e4)
;;     $17 = 5.098148722026963e-5
;;     scheme@(guile-user)> (sqrt-error sqrt-improved 1e5)
;;     $18 = 2.246262738481164e-6
;;     scheme@(guile-user)> (sqrt-error sqrt-improved 1e6)
;;     $19 = 2.3632310330867767e-8
;;     scheme@(guile-user)>
