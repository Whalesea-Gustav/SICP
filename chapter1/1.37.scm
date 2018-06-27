(define (cont-frac n d k)
  
  (define (cont-frac-r i)
    
    (define (end? i)
      (= i k))
    
    (cond ((end? i) (/ (n i)
                       (d i)))
          (else (/ (n i)
                   (+ (d i)
                      (cont-frac-r (+ i 1)))))))
  (cont-frac-r 1))
 
 ;;answer
 
 (contfrac (lambda (x) (1.0)) (lambda (x) (1.0)) 100)
 
 (define (cont-frac N D k)

 (define (iter i result)
      (if (= i 0)
          result
          (iter (- i 1)
                (/ (N i)
                   (+ (D i) result)))))

 (iter (- k 1)
          (/ (N k) (D k))))
