(load "hog.scm")
(load "strategy.scm")

(define (winner? score)
  (> score GOAL))

(define (play player-strategy opponent-strategy player-score opponent-score)
  "Simulate a game and return the final scores of both players, with
    Player 0's score first and Player 1's score second."
  (cond ((winner? player-score) "player")
        ((winner? opponent-score) "opponent")
        (else
         (let ((player-point (take-turn (player-strategy player-score opponent-score) opponent-score))
               (opponent-point (take-turn (opponent-strategy opponent-score player-score) player-score)))
           (play player-strategy
                 opponent-strategy
                 (score-update player-score player-point)
                 (score-update opponent-score opponent-point))))))

;; (play square-strategy tail-strategy 0 0)
