(define (repeated f n)
    (define (iter i repeated-f)
        (if (= i 1)
            repeated-f
            (iter (- i 1)
                  (lambda (x)
                      (f (repeated-f x))))))
    (iter n f))

(define (power base exp)
  (define (mutiple-base n)
    (* base n))
  (cond ((= exp 0) 0)
        (else
         ((repeated mutiple-base exp) 1))))

(define (average-bump f)
  (lambda (x) (/ (+ x (f x))
                 2)))

(define (cont-frac f times)
  ((repeated average-bump times) f))

(define (damped-nth-root n damp-times)
  (lambda (x) (fixed-point (cont-frac (lambda (y) (/ y
                                                    (- n 1))) damp-times) 1.0)))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define tolerance 0.00001)



;; answer
((damp-nth-root 10 2) 10)
使得计算 n 次方根的不动点收敛，最少需要 ⌊lgn⌋ 次平均阻尼
定义 [lg n]
(define (lg n)
    (cond ((> (/ n 2) 1)
            (+ 1 (lg (/ n 2))))
          ((< (/ n 2) 1)
            0)
          (else
            1)))
运用curring 处理 (lg n)             
(define (nth-root n)
    (damped-nth-root n (lg n)))            
