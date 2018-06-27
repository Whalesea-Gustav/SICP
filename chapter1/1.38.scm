(define (cont-frac N D k)

    (define (iter i result)
        (if (= i 0)
            result
            (iter (- i 1)
                  (/ (N i)
                     (+ (D i) result)))))

    (iter (- k 1)
          (/ (N k) (D k))))

(define (d i)
  
  (define (power base exp)
    
    (define (iter exp result)
      (cond ((= exp 0) result)
            (else (iter (- exp 1) (* result base)))))
    
    (iter exp 1))

  (define (special? k)
    (= (remainder (+ k 1) 3) 0))
  
  (cond ((special? i) (power 2 (/ (+ i 1)
                                  3)))
        (else 1)))
        
        
  ;; answer 
  (define (neurual times)
    (+ (cont-frac (lambda (x) 1.0) d times)
       2))
 
