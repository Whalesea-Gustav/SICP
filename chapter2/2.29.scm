#lang sicp
(define (make-mobile left right)
  (list left right))
(define (make-branch left right)
  (list left right))
(define (left-branch mobile)
    (car mobile))

(define (right-branch mobile)
    (cadr mobile))
(define (branch-structure branch)
  (cadr branch))
(define (branch-length branch)
  (car branch))
(define mobile (make-mobile (make-branch 10 20)       ; 活动体的总重量为 20 + 25 = 45
                                  (make-branch 10 25)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))
(define (branch-weight branch)
  (if (hang-another-mobile? branch)
      (total-weight (branch-structure branch))
      (branch-structure branch)))
(define (hang-another-mobile? branch)
  (pair? (branch-structure branch)))


(define (branch-torque branch)
  (* (branch-weight branch)
     (branch-length branch)))





(define (mobile-balance? mobile)
    (let ((left (left-branch mobile))
          (right (right-branch mobile)))
        (and                                        ; 必须同时满足以下三个条件,才是平衡的活动体
            (same-torque? left right)
            (branch-balance? left)
            (branch-balance? right))))





(define (same-torque? left right)
    (= (branch-torque left)
       (branch-torque right)))

(define (branch-balance? branch)
    (if (hangs-another-mobile? branch)              ; 如果分支上有子活动体
        (mobile-balance? (branch-structure branch))  ; 那么(递归地)检查子活动体的平衡性
        #t))      

(define (hangs-another-mobile? branch)              ; 检查分支是否吊着另一个活动体
    (pair? (branch-structure branch)))


(define balance-mobile (make-mobile (make-branch 10 10)
                                          (make-branch 10 10)))
(mobile-balance? balance-mobile)
