#lang sicp
(define (product-r term a next b)
  (cond ((> a b) 1)
        (else (* (term a)
           (product-r term (next a) next b)))))

(define (product-i term a next b)
  (define  (i-aux a result)
    (cond ((> a b) result)
          (else (i-aux (next a) (+ result (term a))))))
  (i-aux a 0))

(define (factorial-i n)
  (product-i (lambda (x) x) 1 (lambda (x) (+ x 1)) n))
(define (facotrial-r n)
  (product-r (lambda (x) x) 1 (lambda (x) (+ x 1)) n))

(define (denum-r n)
  (define (denum-term n)
    (cond ((even? n) (+ n 1))
          (else (+ n 2))))
  (product-r denum-term 1 (lambda (x) (+ x 1)) n))
(define (num-r n)
  (define (num-term k)
    (cond ((even? k) (+ k 2))
          (else (+ k 1))))
  (product-r num-term 1 (lambda (x) (+ x 1)) n))
(define (approximate-pi n)
  (* 4
     (/ (num-r n)
        (denum-r n))))
