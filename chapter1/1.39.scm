
(define (cont-frac N D k)

    (define (iter i result)
        (if (= i 0)
            result
            (iter (- i 1)
                  (/ (N i)
                     (+ (D i) result)))))

    (iter (- k 1)
          (/ (N k) (D k))))

(define (N x)
  (lambda (y)
    (cond ((= y 1) x)
          (else ( - (* x x))))))


;; answer
(define (tan-cf x k)
    


    (define (D i)
        (- (* i 2) 1))

   (cont-frac (N x) D k))
