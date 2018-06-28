
(define (same-parity x . y)
  (define (aux x y)
    (cond ((null? y) nil)
        ((same-parity? x (car y)) (cons (car y) (aux x (cdr y))))
        (else (aux x (cdr y)))))
  (cons x (aux x y)))

  
(define (same-parity? x y)
  (cond ((and (even? x)
              (even? y)) true)
        ((and (odd? x)
              (odd? y)) true)
        (else false)))
