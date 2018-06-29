(define (count-leaves2 tree)
  (accumulate + 0 (map (lambda (x)
                                (cond ((not (pair? x)) 1)
                                      (else (count-leaves2 x)))) tree)))
(define (accumulate f init lst)
  (cond ((null? lst) init)
        (else (f (car lst)
                 (accumulate f init (cdr lst))))))
                 
                 
                 ;;accumulate = reduce
