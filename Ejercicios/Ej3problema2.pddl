(define (problem Problema2)

(:domain Ejercicio3)

(:objects
    oro - Oro
    bruja - Bruja
    manzana - Manzana
    princesa - Princesa
    rosa - Rosa
    principe - Principe
    algoritmo - Algoritmo
    robot - Player
    oscar - Oscar
    diCaprio - Leonardo
    zapas - Zapatilla
    bikini - Bikini
    profe - Profesor
    n s e w - orientation
    z14 z15 z24 z25 z19 z20 - Bosque
    z2 z7 z11 z16 - Agua
    z1 z6 z23 z5 - Precipicio
    z12 z13 z21 z22 z17 z18 - Arena
    z3 z4 z8 z9 z10 - Piedra
)

(:init
    (at z2 oro)
    (connected z1 z2 e) (= (distance z1 z2) 20)
    (connected z2 z1 w) (= (distance z2 z1) 20)
    (at z3 bruja)
    (connected z3 z4 e) (= (distance z3 z4) 5)
    (connected z4 z3 w) (= (distance z4 z3) 5)
    (at z7 manzana)
    (connected z6 z7 e) (= (distance z6 z7) 5)
    (connected z7 z6 w) (= (distance z7 z6) 5)
    (connected z7 z8 e) (= (distance z7 z8) 2)
    (connected z8 z7 w) (= (distance z8 z7) 2)
    (at z9 princesa)
    (at z10 rosa)
    (connected z9 z10 e) (= (distance z9 z10) 10)
    (connected z10 z9 w) (= (distance z10 z9) 10)
    (at z11 principe)
    (at z12 algoritmo)
    (at z13 robot)
    (at z14 oscar)
    (connected z11 z12 e) (= (distance z11 z12) 2)
    (connected z12 z11 w) (= (distance z12 z11) 2)
    (connected z12 z13 e) (= (distance z12 z13) 2)
    (connected z13 z12 w) (= (distance z13 z12) 2)
    (connected z13 z14 e) (= (distance z13 z14) 2)
    (connected z14 z13 w) (= (distance z14 z13) 2)
    (connected z14 z15 e) (= (distance z14 z15) 2)
    (connected z15 z14 w) (= (distance z15 z14) 2)
    (at z21 diCaprio)
    (connected z21 z22 e) (= (distance z21 z22) 5)
    (connected z22 z21 w) (= (distance z22 z21) 5)
    (connected z23 z24 e) (= (distance z23 z24) 15)
    (connected z24 z23 w) (= (distance z24 z23) 15)
    (connected z24 z25 e) (= (distance z24 z25) 10)
    (connected z25 z24 w) (= (distance z25 z24) 10)
    (at z16 zapas)
    (is-sneaker zapas)
    (connected z6 z11 s) (= (distance z6 z11) 5)
    (connected z11 z6 n) (= (distance z11 z6) 5)
    (connected z11 z16 s) (= (distance z11 z16) 5)
    (connected z16 z11 n) (= (distance z16 z11) 5)
    (connected z2 z7 s) (= (distance z2 z7) 10)
    (connected z7 z2 n) (= (distance z7 z2) 10)
    (connected z12 z17 s) (= (distance z12 z17) 2)
    (connected z17 z12 n) (= (distance z17 z12) 2)
    (connected z17 z22 s) (= (distance z17 z22) 2)
    (connected z22 z17 n) (= (distance z22 z17) 2)
    (at z18 bikini)
    (is-bikini bikini)
    (connected z3 z8 s) (= (distance z3 z8) 2)
    (connected z8 z3 n) (= (distance z8 z3) 2)
    (connected z8 z13 s) (= (distance z8 z13) 5)
    (connected z13 z8 n) (= (distance z13 z8) 5)
    (connected z13 z18 s) (= (distance z13 z18) 2)
    (connected z18 z13 n) (= (distance z18 z13) 2)
    (connected z4 z9 s) (= (distance z4 z9) 5)
    (connected z9 z4 n) (= (distance z9 z4) 5)
    (connected z14 z19 s) (= (distance z14 z19) 2)
    (connected z19 z14 n) (= (distance z19 z14) 2)
    (connected z19 z24 s) (= (distance z19 z24) 5)
    (connected z24 z19 n) (= (distance z24 z19) 5)
    (connected z5 z10 s) (= (distance z5 z10) 20)
    (connected z10 z5 n) (= (distance z10 z5) 20)
    (connected z10 z15 s) (= (distance z10 z15) 2)
    (connected z15 z10 n) (= (distance z15 z10) 2)
    (at z20 profe)
    (connected z20 z25 s) (= (distance z20 z25) 10)
    (connected z25 z20 n) (= (distance z25 z20) 10)
    (is-forest z14)
    (is-forest z15)
    (is-forest z24)
    (is-forest z25)
    (is-forest z19)
    (is-forest z20)
    (is-water z2)
    (is-water z7)
    (is-water z11)
    (is-water z16)
    (is-cliff z1)
    (is-cliff z6)
    (is-cliff z23)
    (is-cliff z5)
    (hands-empty robot)
    (bag-empty robot)
    (oriented robot n)
    (= (total-cost) 0)
)

(:goal (AND
    (supplied bruja)
    (supplied princesa)
    (supplied principe)
    (supplied diCaprio)
    (supplied profe)
))

(:metric minimize (total-cost)))