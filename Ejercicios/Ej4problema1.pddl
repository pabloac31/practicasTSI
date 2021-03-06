(define (problem Problema1)

(:domain Ejercicio4)

(:objects
    player - Player
    bruja - Bruja
    zapas - Zapatilla
    prince - Principe
    bikini - Bikini
    manzana - Manzana
    profe - Profesor
    oscar - Oscar
    algoritmo - Algoritmo
    n s e w - orientation
    z4 z8 - Bosque
    z10 - Agua
    z5 - Precipicio
    z2 z7 - Arena
    z1 z3 z6 z9 - Piedra
)

(:init
    (at z1 player)
    (at z2 bruja)
    (at z7 zapas)
    (is-sneaker zapas)
    (at z7 prince)
    (connected z1 z2 s) (= (distance z1 z2) 2)
    (connected z2 z1 n) (= (distance z2 z1) 2)
    (connected z2 z7 s) (= (distance z2 z7) 5)
    (connected z7 z2 n) (= (distance z7 z2) 5)
    (at z3 bikini)
    (is-bikini bikini)
    (at z4 manzana)
    (connected z2 z3 e) (= (distance z2 z3) 2)
    (connected z3 z2 w) (= (distance z3 z2) 2)
    (connected z3 z4 e) (= (distance z3 z4) 5)
    (connected z4 z3 w) (= (distance z4 z3) 5)
    (connected z5 z6 e) (= (distance z5 z6) 10)
    (connected z6 z5 w) (= (distance z6 z5) 10)
    (connected z6 z7 e) (= (distance z6 z7) 10)
    (connected z7 z6 w) (= (distance z7 z6) 10)
    (at z8 profe)
    (connected z5 z8 s) (= (distance z5 z8) 5)
    (connected z8 z5 n) (= (distance z8 z5) 5)
    (at z9 oscar)
    (connected z6 z9 s) (= (distance z6 z9) 5)
    (connected z9 z6 n) (= (distance z9 z6) 5)
    (at z10 algoritmo)
    (connected z8 z9 e) (= (distance z8 z9) 2)
    (connected z9 z8 w) (= (distance z9 z8) 2)
    (connected z9 z10 e) (= (distance z9 z10) 10)
    (connected z10 z9 w) (= (distance z10 z9) 10)
    (is-forest z4)
    (is-forest z8)
    (is-water z10)
    (is-cliff z5)
    (hands-empty player)
    (bag-empty player)
    (oriented player n)
    (= (score oscar bruja) 4)
    (= (score manzana bruja) 10)
    (= (score algoritmo bruja) 1)
    (= (score oscar profe) 3)
    (= (score manzana profe) 5)
    (= (score algoritmo profe) 10)
    (= (score oscar prince) 1)
    (= (score manzana prince) 4)
    (= (score algoritmo prince) 5)
    (= (total-cost) 0)
    (= (total-score) 0)
)

(:goal (AND
    (>= (total-score) 20)
))

(:metric minimize (total-cost)))