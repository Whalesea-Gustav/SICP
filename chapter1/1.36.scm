#lang sicp
(define (find-log x)
  
  (define (fixed-point f guess)
    
    (define (try guess step)
      
      (define (display-info guess step)
        (display "step: ")
         (display step)
         (display " guess: ")
         (display guess)
         (newline))
      
      (define (close? guess next)
        (let ((tolerance 0.00001))
          (< (abs (- guess next))
             tolerance)))
      (let ((next (f guess)))
        (display-info guess step)
         (cond ((close? guess next) next)
               (else (try next (+ step 1))))))
    (try guess 1))
  (define function-dump
    (lambda (f) (lambda (x) (/ (+ x (f x))
                               2))))
  (fixed-point (function-dump (lambda (y) (/ (log x)
                                             (log y)))) 2.0))
    
    
    
  ;;answer
  (find-log 1000)
