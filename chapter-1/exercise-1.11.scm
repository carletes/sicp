;; # Exercise 1.11
;;
;; > A function `f` is defined by the rule that:
;; >
;; >     f(n) = n if n<3
;; > and:
;; >
;; >     f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n>= 3
;; >
;; >  Write a procedure that computes `f` by means of a recursive process.
;; >  Write a procedure that computes `f` by means of an iterative process.

;; The recursive version is a translation of the formula into Scheme:

(define (f-recursive n)
  (cond
   ((< n 3) n)
   (else (+ (f-recursive (- n 1))
	    (* 2 (f-recursive (- n 2)))
	    (* 3 (f-recursive (- n 3)))))))

;; `f-recursive` becomes too slow for `n=30`. The iterative version runs just
;; fine:

(define (f-iterative n)
  (iter 2 1 0 n))

(define (iter a b c n)
  (cond
   ((= n 0) c)
   ((= n 1) b)
   ((= n 2) a)
   (else (iter (+ a
		  (* 2 b)
		  (* 3 c))
	       a
	       b
	       (- n 1)))))
