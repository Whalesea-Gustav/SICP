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






(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))
(define left-branch car)
(define right-branch cdr)
(define branch-length car)
(define branch-structure cdr)

(define balance (make-mobile (make-branch 10 10) (make-branch 10 10)))
(define mobile2 (make-mobile (make-branch 10 10) (make-branch 10 balance)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (hang-over-another-mobile? branch)
  (pair? (branch-structure branch)))

(define (branch-weight branch)
  (cond ((hang-over-another-mobile? branch) (total-weight (branch-structure branch)))
        (else (branch-structure branch))))

(define (mobile-length mobile)
  (+ (sum-branch-length (left-branch mobile))
     (sum-branch-length (right-branch mobile))))

(define (sum-branch-length branch)
  (cond ((hang-over-another-mobile? branch) (+ (mobile-length (branch-structure branch))
                                               (branch-length branch)))
        (else (branch-length branch))))

(define branch1 (make-branch 10 10))
(define branch2 (make-branch 10 (make-mobile (make-branch 10 20) (make-branch 10 10))))

(define (branch-torque branch)
  (* (branch-weight branch)
     (sum-branch-length branch)))

(define (mobile-balance? mobile)
  (= (branch-torque (left-branch mobile))
     (branch-torque (right-branch mobile))))
