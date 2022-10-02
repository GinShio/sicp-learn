(load "dice.scm")
(load "perfect-square.scm")

;; Phase 1: Simulator

;; The goal of Hog is to score 100 points.
(define GOAL 100)

(define (roll-dice num-rolls)
  "Simulate rolling the DICE exactly NUM_ROLLS > 0 times. Return the sum of
    the outcomes unless any of the outcomes is 1. In that case, return 1."
  (let roll-dice-iter ((counter 1) (total 0))
    (let ((point (six-sided)))
      (cond ((> counter num-rolls) total)
            ((= point 1) 1)
            (else (roll-dice-iter (+ counter 1) (+ total point)))))))

(define (tail-points opponent)
  "Return the points scored by rolling 0 dice according to Pig Tail."
  (let ((tens (quotient opponent 10)) (ones (remainder opponent 10)))
    (+ (* (abs (- tens ones)) 2) 1)))

(define (take-turn num-rolls opponent)
  "Return the points scored on a turn rolling NUM_ROLLS dice when the
    opponent has OPPONENT_SCORE points."
  (if (= num-rolls 0)
      (tail-points opponent)
      (roll-dice num-rolls)))

(define (score-update player-score point)
  "Return the total score of a player."
  (let ((total (+ player-score point)))
    (if (perfect-square? total)
        (next-square total)
        total)))
