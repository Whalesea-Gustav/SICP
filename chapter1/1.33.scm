;;实现filter

(define (accumulate-r combiner null-value term a next b)
  (cond ((> a b)
         null-value)
        (else (combiner (term a) (accumulate-r combiner null-value term (next a) next b)))))

(define (filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) 0)
        ((filter a) (combiner (term a) (filtered-accumulate filter combiner null-value term (next a) next b)))
        (else (filtered-accumulate filter combiner null-value term (next a) next b))))


 ;; a)
 (define (prime? n)
    (= n (smallest-divisor n)))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n)
            n)
          ((divides? test-divisor n)
            test-divisor)
          (else
            (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
    (= (remainder b a) 0))

(define (square x)
  (* x x))
  
 (define (primes-sum start end)
     (filtered-accumulate prime? + 0 (lambda (x) x) start (lambda (x) (+ x 1)) end))
  
 ;; b)
 
 (define (gcd a b)
      (cond ((= b 0) a)
            (else (gcd b (remainder a b)))))
 (define (gcd? a b)
      (= (gcd a b) 1))
      
  (define (relatively-primes-sum start end)
     (filtered-accumulate (lambda (x) (gcd? x n)) + 0 (lambda (x) x) start (lambda (x) (+ x 1)) end))
