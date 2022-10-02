(define (perfect-square? number)
  "Return ture if number is a perfect square number."
  (integer? (sqrt number)))

(define (next-square number)
  "Return "
  (expt (1+ (floor (sqrt number))) 2))
