(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (car set)) #t)
        ((< x (car set)) #f)
        (else (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2)) '()
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1 (intersection-set (cdr set1) (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((> x1 x2)
               (intersection-set set1 (cdr set2)))))))

(define (adjoin-set x set)
  (define (loop rest result)
    (cond ((null? rest) (append result (list x)))
          ((= x (car rest)) (append result rest))
          ((< x (car rest)) (append result (cons x rest)))
          (else (loop (cdr rest) (append result (list (car rest)))))))
  (loop set '()))


;; test
(define (println x)
  (display x)
  (newline))

(println (adjoin-set 1 '()))
(println (adjoin-set 1 '(1)))
(println (adjoin-set 0 '(1)))
(println (adjoin-set 2 '(1 2 3)))
(println (adjoin-set 5 '(1 2 3)))
