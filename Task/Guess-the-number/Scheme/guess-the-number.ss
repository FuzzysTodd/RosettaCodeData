(define (guess)
  (define number (random 11))
  (display "Pick a number from 1 through 10.\n> ")
  (do ((guess (read) (read)))
        ((= guess number) (display "Well guessed!\n"))
      (display "Guess again.\n")))