(define (expmod base exp m)
    (remainder (fast-expt base exp) m))
(define (expmod base exp m)
    (cond ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m) m))
          (else (remainder (* base (expmod base (- exp 1)) m))))
 ;;比较上述两种算法
 ;;第一种直接将乘幂的结果放进remainder中，进行地较慢，而且可能乘幂过大导致移除（比如输入10000时）
 ;;第二种采用递归地方式，将乘幂结果分而治之，(大的乘幂)分解成(小的乘幂结果)地运算，使得remainder中的参数非常的小，与第一种方式比较的话。
