(de neighbor (X Y Cost)
   (push (prop X 'neighbors) (cons Y Cost))
   (push (prop Y 'neighbors) (cons X Cost)) )

(de dijkstra (Curr Dest)
   (let Cost 0
      (until (== Curr Dest)
         (let (Min T  Next)
            (for N (; Curr neighbors)
               (with (car N)
                  (let D (+ Cost (cdr N))
                     (unless (and (: distance) (>= D @))
                        (=: distance D) ) )
                  (when (> Min (: distance))
                     (setq Min (: distance)  Next This) )
                  (del (asoq Curr (: neighbors)) (:: neighbors)) ) )
            (setq Curr Next  Cost Min) ) )
      Cost ) )