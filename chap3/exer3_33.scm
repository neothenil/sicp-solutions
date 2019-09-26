(define (averager a b c)
  (let ((w (make-connector))
        (v (make-connector)))
    (multiplier c v w)
    (adder a b w)
    (constant 2 v)
    'ok))