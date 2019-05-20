(define (problem Problema1)

(:domain Ejercicio1)

(:objects
    z1 z2 z3 z4 z5 z6 z7 - zone
    bruja1 - Bruja
    player1 - Player
    manzana1 - Manzana
    oscar1 - Oscar
    princesa1 - Princesa
    n s e w - orientation
)

(:init
    (at z1 bruja1)
    (connected z1 z3 s)
    (connected z3 z1 n)
    (connected z3 z6 s)
    (connected z6 z3 n)
    (at z2 player1)
    (at z4 manzana1)
    (connected z2 z3 e)
    (connected z3 z2 w)
    (connected z3 z4 e)
    (connected z4 z3 w)
    (at z5 oscar1)
    (at z7 princesa1)
    (connected z5 z6 e)
    (connected z6 z5 w)
    (connected z6 z7 e)
    (connected z7 z6 w)
    (hands-empty player1)
    (oriented player1 n)
)

(:goal (AND
    (supplied bruja1)
    (supplied princesa1)
))

)