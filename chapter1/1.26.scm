;;原本的 expmod 在每次 exp 为偶数时，可以将计算量减少一半：
(remainder (square (expmod base (/ exp 2) m)) m)

;;但是因为 Louis 的 expmod 重复计算了两次 (expmod base (/ exp 2) m) ：

(remainder (* (expmod base (/ exp 2) m)
              (expmod base (/ exp 2) m))
           m)
;;所以每次当 exp 为偶数时， Louis 的 expmod 过程的计算量就会增加一倍，因此原本 Θ(logn) 的计算过程变成了 Θ(n)
;;Q: 为什么O(log n)的算法过程增加一倍是 O (n)?
