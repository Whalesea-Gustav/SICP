(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))
(define (car x)
  (if (= 0 (remainder x 2))
      (+ 1
         (car (/ x 2)))
      0))
(define (cdr x)
  (if (= (remainder x 3))
      (+ 1
         (car (/ x 3)))
      0))
