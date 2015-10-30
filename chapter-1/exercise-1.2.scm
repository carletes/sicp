;; Exercise 1.2: Translate the following expression into prefix
;; form.
;;
;;     5 + 4 + (2 - (3 - (6 + 4/5)))
;;     -----------------------------
;;            3(6 - 2)(2 - 7)

(define expression
  (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
     (* 3 (- 6 2) (- 2 7))))

;; The result is a *rational* number:
;;
;;     scheme@(guile-user)> expression
;;     $4 = -37/150
;;     scheme@(guile-user)>
