(define (make-fair-dice side)
  "Return a die that returns 1 to SIDES with equal chance."
  (lambda () (1+ (random-integer side))))

(define four-sided (make-fair-dice 4))
(define six-sided (make-fair-dice 6))
