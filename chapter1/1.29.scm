;;apply Simpson's rule in high-oder process

#lang sicp
(define (simpson-rule f a b n)
  
  (define (sum term a next b)
    (cond ((> a b) 0)
          
          (else (+ (term a)
                   (sum term (next a) next b)))))
  
  (define h (/ (- b a) n))
  
  (define (y k) (f (+ a
                      (* k h))))
  
  (define (factor x)
    (cond ((or (= x 0) (= x n)) 1)
          ((even? x)
           2)
          (else
           4)))
  
  (define general-process
    (lambda (k) (* (factor k)
                   (y k))))
  (* (/ h 3)
     (sum general-process 0 (lambda (x) (+ x 1)) n)))
