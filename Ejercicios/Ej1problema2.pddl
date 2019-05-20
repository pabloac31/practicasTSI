(define (problem Problema2)

(:domain Ejercicio1)

(:objects
    z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 z21 z22 z23 z24 z25 - zone
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
    profe - Profesor
    n s e w - orientation
)

(:init
    (at z2 oro)
    (connected z1 z2 e)
    (connected z2 z1 w)
    (at z3 bruja)
    (connected z3 z4 e)
    (connected z4 z3 w)
    (at z7 manzana)
    (connected z6 z7 e)
    (connected z7 z6 w)
    (connected z7 z8 e)
    (connected z8 z7 w)
    (at z9 princesa)
    (at z10 rosa)
    (connected z9 z10 e)
    (connected z10 z9 w)
    (at z11 principe)
    (at z12 algoritmo)
    (at z13 robot)
    (at z14 oscar)
    (connected z11 z12 e)
    (connected z12 z11 w)
    (connected z12 z13 e)
    (connected z13 z12 w)
    (connected z13 z14 e)
    (connected z14 z13 w)
    (connected z14 z15 e)
    (connected z15 z14 w)
    (at z21 diCaprio)
    (connected z21 z22 e)
    (connected z22 z21 w)
    (connected z23 z24 e)
    (connected z24 z23 w)
    (connected z24 z25 e)
    (connected z25 z24 w)
    (connected z6 z11 s)
    (connected z11 z6 n)
    (connected z11 z16 s)
    (connected z16 z11 n)
    (connected z2 z7 s)
    (connected z7 z2 n)
    (connected z12 z17 s)
    (connected z17 z12 n)
    (connected z17 z22 s)
    (connected z22 z17 n)
    (connected z3 z8 s)
    (connected z8 z3 n)
    (connected z8 z13 s)
    (connected z13 z8 n)
    (connected z13 z18 s)
    (connected z18 z13 n)
    (connected z4 z9 s)
    (connected z9 z4 n)
    (connected z14 z19 s)
    (connected z19 z14 n)
    (connected z19 z24 s)
    (connected z24 z19 n)
    (connected z5 z10 s)
    (connected z10 z5 n)
    (connected z10 z15 s)
    (connected z15 z10 n)
    (at z20 profe)
    (connected z20 z25 s)
    (connected z25 z20 n)
    (hands-empty robot)
    (oriented robot n)
)

(:goal (AND
    (supplied bruja)
    (supplied princesa)
    (supplied principe)
    (supplied diCaprio)
    (supplied profe)
))

)