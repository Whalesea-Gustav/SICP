(define (last-pair lst)
  (define (aux head tail)
    (if (null? tail)
        head
        (aux (car tail) (cdr tail))))
  (aux (car lst) (cdr lst)))
