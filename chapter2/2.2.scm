
(define (make-segment a b) (cons a b))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point a b) (cons a b))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (let ((mp (make-point (/ (+ (x-point (start-segment s))
                              (x-point (end-segment s)))
                           2)
                        (/ (+ (y-point (start-segment s))
                              (y-point (end-segment s)))
                           2))))
    (print-point mp)))
