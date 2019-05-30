(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))
(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")")
  (newline))

(define (make-segment a b) (cons a b))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))
(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start-segment s))
                    (x-point (end-segment s)))
                 2)
              (/ (+ (y-point (start-segment s))
                    (y-point (end-segment s)))
                 2)))
(define (length-segment s)
  (define point-a (start-segment s))
  (define point-b (end-segment s))
  (define xa (x-point point-a))
  (define ya (y-point point-a))
  (define xb (x-point point-b))
  (define yb (y-point point-b))
  (sqrt (+ (expt (- xb xa) 2)
           (expt (- yb ya) 2))))

;; Representation 1
; (define (rect xlen ylen) (cons xlen ylen))
; (define (rect-x rec) (car rec))
; (define (rect-y rec) (cdr rec))

;; Representation 2
(define (rect p1 p2) (cons p1 p2))
(define (rect-x rec)
  (abs (- (x-point (car rec))
          (x-point (cdr rec)))))
(define (rect-y rec)
  (abs (- (y-point (car rec))
          (y-point (cdr rec)))))

;; common procedures
(define (rect-perimeter rec)
  (* 2 (+ (rect-x rec) (rect-y rec))))
(define (rect-area rec)
  (* (rect-x rec) (rect-y rec)))

;; test for repr 1
; (define rec (rect 3 4))
; (display (rect-perimeter rec))
; (newline)
; (display (rect-area rec))
; (newline)

;; test for reprr 2
(define point-a (make-point 0 0))
(define point-b (make-point 3 4))
(define rec (rect point-a point-b))
(display (rect-perimeter rec))
(newline)
(display (rect-area rec))
(newline)
