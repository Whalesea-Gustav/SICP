#lang sicp
(define a 1)
(define b 2)
(define l1 (list a b))
(define l2 (list 'a 'a))

(define (memq item symbol-list)
  (cond 
        [(null? symbol-list) false]
        [(eq? item (car symbol-list)) item]
        [true (memq item (cdr symbol-list))]))

(define (equal? symbol-list1 symbol-list2)
  (cond [(and (null? symbol-list1)
              (null? symbol-list2)) true]
        [(or (null? symbol-list1)
             (null? symbol-list2)) false]
        [true (let ([head1 (car symbol-list1)]
                    [head2 (car symbol-list2)]
                    [tail1 (cdr symbol-list1)]
                    [tail2 (cdr symbol-list2)])
                (cond [(and (list? head1)
                            (list? head2)) (and (equal? head1 head2)
                                                (equal? tail1 tail2))]
                      [(or (list? head1)
                           (list? head2)) false]
                      [(eq? head1 head2) (equal? tail1 tail2)]
                      [true false]))]))
