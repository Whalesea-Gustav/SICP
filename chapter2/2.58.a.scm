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

(define (=number? var num)
  (and (number? var)
       (= var num)))

;new sum operation
(define (sum? exp)
  (and (list? exp)
       (eq? (cadr exp)
            '+)))

(define (make-sum a1 a2)
  (cond [(=number? a1 0) a2]
        [(=number? a2 0) a1]
       ; [(and (number? a1)
       ;       (number? a2)) (+ a1 a2)]
        [(eq? a1 a2) (make-product 2 a1)]
        [true (list  a1 '+ a2)]))
(define (addend exp)
  (car exp))
(define (augend exp)
  (car (cdr (cdr exp))))

;new production
(define (make-product m1 m2)
  (cond [(or (=number? m1 0)
             (=number? m2 0)) 0]
        [(=number? m1 1) m2]
        [(=number? m2 1) m1]
        [(and (number? m1)
              (number? m2)) (* m1 m2)]
        [true (list m1 '* m2)]))

(define (product? exp)
  (and (list? exp)
       (eq? (cadr exp) '*)))

(define multiplier car)
(define multiplicand caddr)
  
