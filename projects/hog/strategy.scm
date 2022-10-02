(load "perfect-square.scm")
(load "hog.scm")

(define THRESHOLD 12)
(define NUM-ROLLS 4)

(define (always-roll n)
  "Return a player strategy that always rolls N dice."
  (lambda (player-score opponent-score)
    n))

(define (catch-up player-score opponent-score)
  "A player strategy that always rolls 5 dice unless the opponent
    has a higher score, in which case 6 dice are rolled."
  (if (< player-score opponent-score)
      (1+ NUM-ROLLS)
      NUM-ROLLS))

(define (compare diff)
  (if (< diff THRESHOLD)
      NUM-ROLLS
      0))

(define (tail-strategy player-score opponent-score)
  "This strategy returns 0 dice if Pig Tail gives at least THRESHOLD
    points, and returns NUM_ROLLS otherwise. Ignore score and Square Swine."
  (compare (tail-points opponent-score)))

(define (square-strategy player-score opponent-score)
  "This strategy returns 0 dice when your score would increase by at least threshold."
  (let ((pig-tail (tail-points opponent-score)))
    (let ((score (+ pig-tail player-score)))
      (if (perfect-square? score)
          (compare (- (next-square score) player-score))
          (compare pig-tail)))))
