# Exercise 1.5

> Ben Bitdiddle has invented a test to determine
> whether the interpreter he is faced with is using
> applicative-order evaluation or normal-order evaluation.  He
> defines the following two procedures:
>
> ```scheme
> (define (p) (p))
>
> (define (test x y)
>   (if (= x 0)
>       0
>       y))
> ```
>
> Then he evaluates the expression
>
> ```scheme
> (test 0 (p))
> ```
>
> What behavior will Ben observe with an interpreter that uses
> applicative-order evaluation?  What behavior will he observe with
> an interpreter that uses normal-order evaluation?  Explain your
> answer.  (Assume that the evaluation rule for the special form
> `if` is the same whether the interpreter is using normal or
> applicative order: The predicate expression is evaluated first,
> and the result determines whether to evaluate the consequent or
> the alternative expression.

An applicative-order interpreter will enter an infinite loop, since it will
evaluate the operator `test`, then the first argument `0` (both of which will
complete), and then it will try to evaluate `(p)`, which will evaluate to
itself, and so on and so forth.

My guess is that a normal-order interpreter will never manage to expand
`(test 0 (p))`, for similar reasons, so it will never get to the point
of reducing its arguments.
