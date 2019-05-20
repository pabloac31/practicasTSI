(define (problem Problema1)

(:domain Ejercicio2)

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
    (connected z1 z3 s) (= (distance z1 z3) 10)
    (connected z3 z1 n) (= (distance z3 z1) 10)
    (connected z3 z6 s) (= (distance z3 z6) 5)
    (connected z6 z3 n) (= (distance z6 z3) 5)
    (at z2 player1)
    (at z4 manzana1)
    (connected z2 z3 e) (= (distance z2 z3) 10)
    (connected z3 z2 w) (= (distance z3 z2) 10)
    (connected z3 z4 e) (= (distance z3 z4) 5)
    (connected z4 z3 w) (= (distance z4 z3) 5)
    (at z5 oscar1)
    (at z7 princesa1)
    (connected z5 z6 e) (= (distance z5 z6) 10)
    (connected z6 z5 w) (= (distance z6 z5) 10)
    (connected z6 z7 e) (= (distance z6 z7) 5)
    (connected z7 z6 w) (= (distance z7 z6) 5)
    (hands-empty player1)
    (oriented player1 n)
    (= (total-cost) 0)
)

(:goal (AND
    (supplied bruja1)
    (supplied princesa1)
))

(:metric minimize (total-cost)))