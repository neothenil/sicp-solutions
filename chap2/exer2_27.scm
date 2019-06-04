(define (deep-reverse li)
  (define (iter left result)
    (cond ((null? left) result)
          ((pair? (car left))
           (iter (cdr left) (cons (iter (car left) (list)) result)))
          (else (iter (cdr left) (cons (car left) result)))))
  (iter li (list)))
