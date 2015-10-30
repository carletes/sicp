# Exercise 1.6

> Alyssa P. Hacker doesn't see why `if` needs to be
> provided as a special form.  "Why can't I just define it as an
> ordinary procedure in terms of `cond`?" she asks.  Alyssa's friend
> Eva Lu Ator claims this can indeed be done, and she defines a new
> version of `if`:
>
>     (define (new-if predicate then-clause else-clause)
>       (cond (predicate then-clause)
>             (else else-clause)))
>
> Eva demonstrates the program for Alyssa:
>
>     (new-if (= 2 3) 0 5)
>     5
>
>     (new-if (= 1 1) 0 5)
>     0
>
> Delighted, Alyssa uses `new-if` to rewrite the square-root program:
>
>     (define (sqrt-iter guess x)
>       (new-if (good-enough? guess x)
>               guess
>               (sqrt-iter (improve guess x)
>                          x)))
>
> What happens when Alyssa attempts to use this to compute square
> roots?  Explain.

The evaluation of `(sqrt-iter guess x)` will never finish, since the Scheme
interpreter will evaluate the "else" of `new-if` (that is, its second
parameter) regardless of whether the conditional clause (its first parameter)
was true or false:

    scheme@(guile-user)> (sqrt-iter 2 4)
    <unnamed port>:66:18: In procedure good-enough?:
    <unnamed port>:66:18: Throw to key vm-error' with args (vm-run "VM: Stack overflow" ())'.

    Entering a new prompt.  Type ,bt' for a backtrace or ,q' to continue.
    scheme@(guile-user) [1]
