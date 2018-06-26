;;运行时间、步数和算法复杂度
;;首先，即使我们能准确地计算出程序所需的步数，程序的运行速度还是会受到其他条件的影响，比如计算机的快慢，系统资源的占用情况，或者编译器/解释器的优化程度，等等，即使是同样的一个程序，在不同情况下运行速度也会有所不同，所以程序的计算步数能对程序的运行状况给出有用的参考信息，但是它没办法、也不可能完全准确预测程序的运行时间。

;;另一方面，算法复杂度比计算步数更进一步，它无须精确计算程序的步数 —— 算法复杂度考虑的是增长速度的快慢：比如说，当我们说一个算法 A 的复杂度比另一个算法 B 的复杂度要高的时候，意思是说，算法 A 计算所需的资源（时间或空间）要比算法 B 要多。

;;一般来说，复杂度更低的算法，实际的运行速度总比一个复杂度更高的算法要来得更快，有时候在输入比较小时会比较难看出差别，但是当输入变得越来越大的时候，低复杂度算法的优势就会体现出来。

;;举个例子， 练习 1.22 的 search-for-primes 程序的复杂度就是 Θ(n−−√) ，而在本题给出的 search-for-primes 的复杂度就是 Θ(logn) ，我们可以预期，本题给出的 search-for-primes 总比 练习 1.22 的 search-for-primes 要快。

;;先来测试 练习 1.22 的 search-for-primes ：

1 ]=> (load "22-search-for-primes.scm")

;Loading "22-search-for-primes.scm"...
;  Loading "22-continue-primes.scm"...
;    Loading "p33-prime.scm"...
;      Loading "p33-smallest-divisor.scm"...
;        Loading "p33-divides.scm"... done
;        Loading "p33-find-divisor.scm"... done
;      ... done
;    ... done
;    Loading "22-next-odd.scm"... done
;  ... done
;... done
;Value: search-for-primes

1 ]=> (search-for-primes 10000) ; 一万
10007
10009
10037
are primes.
;Value: 1

1 ]=> (search-for-primes 100000000) ; 一亿
100000007
100000037
100000039
are primes.
;Value: 73

1 ]=> (search-for-primes 1000000000000) ; 一万亿
1000000000039
1000000000061
1000000000063
are primes.
;Value: 7679
再来测试本题的 search-for-primes ：

1 ]=> (load "24-search-for-primes.scm")

;Loading "24-search-for-primes.scm"...
;  Loading "22-search-for-primes.scm"...
;    Loading "22-continue-primes.scm"...
;      Loading "p33-prime.scm"...
;        Loading "p33-smallest-divisor.scm"...
;          Loading "p33-divides.scm"... done
;          Loading "p33-find-divisor.scm"... done
;        ... done
;      ... done
;      Loading "22-next-odd.scm"... done
;    ... done
;  ... done
;  Loading "p34-fast-prime.scm"...
;    Loading "p34-expmod.scm"... done
;  ... done
;... done
;Value: prime?

1 ]=> (search-for-primes 10000) ; 一万
10007
10009
10037
are primes.
;Value: 2

1 ]=> (search-for-primes 100000000) ; 一亿
100000007
100000037
100000039
are primes.
;Value: 4

1 ]=> (search-for-primes 1000000000000) ; 一万亿
1000000000039
1000000000061
1000000000063
are primes.
;Value: 9

1 ]=> (search-for-primes 1000000000000000)  ; 一千万亿
1000000000000037
1000000000000091
1000000000000159
are primes.
;Value: 24
可以看到，当输入比较小时，两个算法的速度差不多，但是随着输入越来越大，低复杂度算法的优势就会凸显出来。
