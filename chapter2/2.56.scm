#lang sicp
(define variable? symbol?)
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

;addition operation
;reduction process included in make
(define (make-sum a1 a2)
  (cond [(=number? a1 0) a2]
        [(=number? a2 0) a1]
        [(and (number? a1)
              (number? a2)) (+ a1 a2)]
        [true (list '+ a1 a2)]))
(define (=number? exp var)
  (and (number? exp)
       (= exp var)))

(define (sum? exp)
  (and (list? exp)
       (same-variable? (car exp) '+)))
(define (addend exp)
  (car (cdr exp)))
(define (augend exp)
  (car (cdr (cdr exp))))

;mutiple operation
;reduction proccess included in make

(define (make-product m1 m2)
  (cond [(or (=number? m1 0)
             (=number? m2 0)) 0]
        [(=number? m1 1) m2]
        [(=number? m2 2) m1]
        [(and (number? m1)
              (number? m2)) (* m1 m2)]
        [true (list '* m1 m2)]))

(define (product? exp)
  (and (list? exp)
       (eq? (car exp) '*)))
(define multiplier cadr)
(define multiplicand caddr)

;exponentiation? base exponent make-exponentiation
(define (power base exponent)
  (cond [(= base 0) 1]
        [(= base 1) 1]
        [(= exponent 0) 1]
        [(* base (power base (- exponent 1)))]))

(define (make-exponentiation base exponent)
  (cond [(=number? base 0) 1]
        [(=number? base 1) 1]
        [(=number? exponent 0) 1]
        [(=number? exponent 1) base]
        [(and (number? base)
              (number? exponent)) (power base exponent)]
        [true (list '** base exponent)]))

(define base cadr)
(define exponent caddr)

(define (exponentiation? exp)
  (and (pair? exp)
       (eq? (car exp) '**)))