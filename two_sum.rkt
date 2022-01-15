#lang racket

(define (two-sum lst target)
  (filter (λ (x) (= target (+ (car x) (cadr x))))
          (combinations lst 2))
)

(two-sum '(1 2 3) 5)