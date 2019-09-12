(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ((and (number? base) (number? exponent)) (exp base exponent))
        (else (list '** base exponent))))
(define (base e) (cadr e))
(define (exponent e) (caddr e))

(define (install-deriv-exp)
  (define (deriv-exp exp var)
     (make-product (make-product (exponent exp)
                                 (make-exponentiation
                                   (base exp)
                                   (make-sum (exponent exp) -1)))
                   (deriv (base exp) var)))
  (put 'deriv '** deriv-exp)
  'done)
