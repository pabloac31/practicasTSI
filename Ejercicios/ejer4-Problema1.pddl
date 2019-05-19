(define (problem Problema1)

(:domain EJER4)

(:objects
    player1 - Player
    bruja1 - Bruja
    zapas - Zapatilla
    prince - Principe
    bikini - Bikini
    manzana1 - Manzana
    oscar - Oscar
    profe - Profesor
    manzana - Manzana
    n s e w - orientation
    z4 z7 - Bosque
    z9 - Agua
    z2 z6 - Arena
    z1 z3 z5 z8 - Piedra
)

(:init
    (at z1 player1)
    (at z2 bruja1)
    (at z6 zapas)
    (is-sneaker zapas)
    (at z6 prince)
    (connected z1 z2 s) (= (distance z1 z2) 2)
    (connected z2 z1 n) (= (distance z2 z1) 2)
    (connected z2 z6 s) (= (distance z2 z6) 5)
    (connected z6 z2 n) (= (distance z6 z2) 5)
    (at z3 bikini)
    (is-bikini bikini)
    (at z4 manzana1)
    (connected z2 z3 e) (= (distance z2 z3) 2)
    (connected z3 z2 w) (= (distance z3 z2) 2)
    (connected z3 z4 e) (= (distance z3 z4) 5)
    (connected z4 z3 w) (= (distance z4 z3) 5)
    (connected z5 z6 e) (= (distance z5 z6) 10)
    (connected z6 z5 w) (= (distance z6 z5) 10)
    (at z8 oscar)
    (connected z5 z8 s) (= (distance z5 z8) 5)
    (connected z8 z5 n) (= (distance z8 z5) 5)
    (at z7 profe)
    (at z9 manzana)
    (connected z7 z8 e) (= (distance z7 z8) 2)
    (connected z8 z7 w) (= (distance z8 z7) 2)
    (connected z8 z9 e) (= (distance z8 z9) 10)
    (connected z9 z8 w) (= (distance z9 z8) 10)
    (is-forest z4)
    (is-forest z7)
    (is-water z9)
    (hands-empty player1)
    (bag-empty player1)
    (oriented player1 n)
    (= (score oscar bruja1) 4)
    (= (score manzana1 bruja1) 10)
    (= (score manzana bruja1) 10)
    (= (score oscar profe) 3)
    (= (score manzana1 profe) 5)
    (= (score manzana profe) 5)
    (= (score oscar prince) 1)
    (= (score manzana1 prince) 4)
    (= (score manzana prince) 4)
    (= (total-cost) 0)
    (= (total-score) 0)
)

(:goal (AND
    (>= (total-score) 15)))

(:metric minimize (total-cost)))