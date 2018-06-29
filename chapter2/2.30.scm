(define (square-tree tree)
  (cond ((null? tree) nil)
        ((pair? tree) (cons (square-tree (car tree)) (square-tree (cdr tree))))
        (else (* tree tree))))

(define (square-tree2 tree)
  (tree-map (lambda (x) (* x x)) tree))

(define (tree-map f tree)
  (cond ((null? tree) nil)
        ((pair? tree) (cons (tree-map f (car tree)) (tree-map f (cdr tree))))
        (else (f tree))))
