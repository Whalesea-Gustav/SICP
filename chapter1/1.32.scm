(define (accumulate-r combiner null-value term a next b)
  (cond ((> a b)
         null-value)
        (else (combiner (term a) (accumulate-r combiner null-value term (next a) next b)))))



(define (accumulate-i combiner null-value term a next b)
  (define (aux a result)
    (cond ((> a b) result)
          (else (aux (next a)
                     (combiner result (term a))))))
  
  (aux a null-value))
  
