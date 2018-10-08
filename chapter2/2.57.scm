#lang sicp
(define (deriv exp var)
  (cond [(number? exp) 0]
        [(variable? exp) (if (same-variable? exp var)
                             1
                             0)]
        [(sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var))]
        [(product? exp) (make-sum
                         (make-product
                          (multiplier exp)
                          (deriv (multiplicand exp) var))
                         (make-product
                          (multiplicand exp)
                          (deriv (multiplier exp) var)))]
        (true (error "unknown expression type" exp))))
(define variable? symbol?)
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))
(define (single-operation? exp)
  (eq? (cdr exp)
     nil))

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
  (cadr exp))

(define (augend exp)
  (let ([tail (cdr (cdr exp))])
    (if (single-operation? tail)
        (car tail)
        (cons '+ tail))))

;mutiple operation
;reduction proccess included in make

(define (make-product m1 m2)
  (cond [(or (=number? m1 0)
             (=number? m2 0)) 0]
        [(=number? m1 1) m2]
        [(=number? m2 1) m1]
        [(and (number? m1)
              (number? m2)) (* m1 m2)]
        [true (list '* m1 m2)]))

(define (product? exp)
  (and (list? exp)
       (eq? (car exp) '*)))

(define multiplier cadr)

(define (multiplicand exp)
  (let ([tail (cdr (cdr exp))])
    (if (single-operation? tail)
        (car tail)
        (cons '* tail))))