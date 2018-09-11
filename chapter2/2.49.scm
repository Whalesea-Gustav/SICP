#lang racket
( require ( planet "sicp.ss" ( "soegaard" "sicp.plt" 2 1))) 
;;导入SPL库
;;http://planet.racket-lang.org/package-source/soegaard/sicp.plt/2/1/planet-docs/sicp-manual/index.html#(part._.Frames)
;;paint函数作用在painter上, 自动生成图像
;;painter是以frame作为参数的过程, 自动在frame上填充出(经过向量变换的)图像

;;outline->painter

;;apex
(define top-left (make-vect 0.25 0.75))
(define top-right (make-vect 0.75 0.75))
(define bottom-left (make-vect 0.25 0.25))
(define bottom-right (make-vect 0.75 0.25))
;;border

(define top (make-segment top-left top-right))
(define left (make-segment top-left bottom-left))
(define right (make-segment top-right bottom-right))
(define bottom (make-segment bottom-left bottom-right))

(define outline->painter (segments->painter (list top left right bottom)))
(paint outline->painter)


;;fork->painter

;;border
(define fork1 (make-segment bottom-left top-right))
(define fork2 (make-segment top-left bottom-right))

(define fork->painter (segments->painter (list fork1 fork2)))
(paint fork->painter)

;;diamond->painter

(define (mid-point segment)
  (make-vect (/ (+ (vector-xcor (segment-start segment))
                   (vector-xcor (segment-end segment)))
                2)
             (/ (+ (vector-ycor (segment-start segment))
                   (vector-ycor (segment-end segment)))
                2)))
;;apex
(define top-mid (mid-point top))
(define bottom-mid (mid-point bottom))
(define left-mid (mid-point left))
(define right-mid (mid-point right))

;;border
(define lt (make-segment left-mid top-mid))
(define br (make-segment bottom-mid right-mid))
(define lb (make-segment left-mid bottom-mid))
(define tr (make-segment top-mid right-mid))


(define diamond->painter (segments->painter (list lt br lb tr)))

(paint diamond->painter)

(define wave->painter
  (segments->painter (list
                         (make-segment (make-vect 0.4 1.0)      ; 头部左上
                                       (make-vect 0.35 0.85))
                         (make-segment (make-vect 0.35 0.85)    ; 头部左下
                                       (make-vect 0.4 0.64))
                         (make-segment (make-vect 0.4 0.65)     ; 左肩
                                       (make-vect 0.25 0.65))
                         (make-segment (make-vect 0.25 0.65)    ; 左手臂上部
                                       (make-vect 0.15 0.6))
                         (make-segment (make-vect 0.15 0.6)     ; 左手上部
                                       (make-vect 0.0 0.85))

                         (make-segment (make-vect 0.0 0.65)     ; 左手下部
                                       (make-vect 0.15 0.35))
                         (make-segment (make-vect 0.15 0.35)    ; 左手臂下部
                                       (make-vect 0.25 0.6))

                         (make-segment (make-vect 0.25 0.6)     ; 左边身体
                                       (make-vect 0.35 0.5))
                         (make-segment (make-vect 0.35 0.5)     ; 左腿外侧
                                       (make-vect 0.25 0.0))
                         (make-segment (make-vect 0.6 1.0)      ; 头部右上
                                       (make-vect 0.65 0.85))
                         (make-segment (make-vect 0.65 0.85)    ; 头部右下
                                       (make-vect 0.6 0.65))
                         (make-segment (make-vect 0.6 0.65)     ; 右肩
                                       (make-vect 0.75 0.65))
                         (make-segment (make-vect 0.75 0.65)    ; 右手上部
                                       (make-vect 1.0 0.3))

                         (make-segment (make-vect 1.0 0.15)     ; 右手下部
                                       (make-vect 0.6 0.5))
                         (make-segment (make-vect 0.6 0.5)      ; 右腿外侧
                                       (make-vect 0.75 0.0))

                         (make-segment (make-vect 0.4 0.0)      ; 左腿内侧
                                       (make-vect 0.5 0.3))
                         (make-segment (make-vect 0.6 0.0)      ; 右腿内侧
                                       (make-vect 0.5 0.3)))))

(paint wave->painter)
