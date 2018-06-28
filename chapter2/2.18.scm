(define (reverse lst)
  (define (aux lst acc)
    (if (null? lst)
        acc
        (aux (cdr lst) (cons (car lst) acc))))
  (aux lst nil))
