#lang sicp
(define (deriv exp var)
  (cond [(number? exp) 0]
        [(variable? exp) (if (same-variable? exp var)
                             1
                             0)]
        [(eq? exp nil) 0]
        [(single-operation? exp) (deriv (car exp) var)]
        [(sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var))]
        [(product? exp) (if (have-sum? exp)
                            (let ([extract-before (lambda (exp)
                                                    (define (aux exp)
                                                      (cond [(null? exp) nil]
                                                            [(same-variable? (car exp) '+) nil]
                                                            [true (cons (car exp) (aux (cdr exp)))]))
                                                    (aux exp))]
                                  [extract-after (lambda (exp)
                                                   (define (aux exp)
                                                     (cond [(null? exp) nil]
                                                           [(same-variable? (car exp) '+) (cdr exp)]
                                                           [true (aux (cdr exp))]))
                                                   (aux exp))])
                                                  
                              (make-sum (deriv (extract-before exp) var)
                                        (deriv (extract-after exp) var)))
                            (make-sum
                             (make-product
                              (multiplier exp)
                              (deriv (multiplicand exp) var))
                             (make-product
                              (multiplicand exp)
                              (deriv (multiplier exp) var))))]
        (true (error "unknown expression type" exp))))

(define (memq item symbol-list)
  (cond 
        [(null? symbol-list) false]
        [(eq? item (car symbol-list)) item]
        [true (memq item (cdr symbol-list))]))

(define variable? symbol?)
(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (=number? var num)
  (and (number? var)
       (= var num)))
(define (single-operation? exp)
  (eq? (cdr exp)
     nil))
(define (have-sum? exp)
  (cond [(null? exp) false]
        [(same-variable? (car exp) '+) true]
        [true (have-sum? (cdr exp))]))


;new sum operation
(define (sum? exp)
  (and (list? exp)
       (eq? (cadr exp)
            '+)))

(define (make-sum a1 a2)
  (cond [(=number? a1 0) a2]
        [(=number? a2 0) a1]
        [(and (number? a1)
              (number? a2)) (+ a1 a2)]
        ;[(eq? a1 a2) (make-product 2 a1)]
        [true (list  a1 '+ a2)]))
        
(define (addend exp)
  (car exp))
(define (augend exp)
  (let ([tail (cdr (cdr exp))])
    (if (single-operation? tail)
        (car tail)
        tail)))

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
(define (multiplicand exp)
  (let ([tail (cdr (cdr exp))])
    (if (single-operation? tail)
        (car tail)
        tail)))
  
