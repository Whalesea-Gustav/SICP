(define (fringe tree)
  (cond ((null? tree) tree)
        ((not (pair? tree)) (list tree))
        ((pair? tree) (append (fringe (car tree)) (fringe (cdr tree))))))
(define (append l1 l2)
  (cond ((null? l1) l2)
        (else (cons (car l1) (append (cdr l1) l2)))))

;;二叉树成表
