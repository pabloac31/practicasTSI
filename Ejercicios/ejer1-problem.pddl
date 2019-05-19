(define (problem Problema2)

(:domain Ejercicio1)

(:objects
        z1 z2 z3 z4 z5 z6 z7 z8 z9 z10 z11 z12 z13 z14 z15 z16 z17 z18 z19 z20 z21 z22 z23 z24 z25 - zone
        princesa - Princesa
        principe - Principe
        bruja - Bruja
        profesor - Profesor
        diCaprio - Leonardo
        oscar - Oscar
        manzana - Manzana
        rosa - Rosa
        algoritmo - Algoritmo
        oro - Oro
        n s e w - orientation
        jugador - Player
    )

    (:init
        ;-----------------------------------------------------
        ; connecteds from zone 1 to zone 25
        ;-----------------------------------------------------

        (connected z1 z2 e)

        (connected z2 z1 w)
        (connected z2 z7 s)

        (connected z3 z4 e)
        (connected z3 z8 s)

        (connected z4 z3 w)
        (connected z4 z9 s)

        (connected z5 z10 s)

        (connected z6 z7 e)
        (connected z6 z11 s)

        (connected z7 z2 n)
        (connected z7 z6 w)
        (connected z7 z8 e)

        (connected z8 z3 n)
        (connected z8 z7 w)
        (connected z8 z13 s)

        (connected z9 z4 n)
        (connected z9 z10 e)

        (connected z10 z5 n)
        (connected z10 z9 w)
        (connected z10 z15 s)

        (connected z11 z6 n)
        (connected z11 z12 e)
        (connected z11 z16 s)

        (connected z12 z11 w)
        (connected z12 z13 e)
        (connected z12 z17 s)

        (connected z13 z8 n)
        (connected z13 z12 w)
        (connected z13 z14 e)
        (connected z13 z18 s)

        (connected z14 z13 w)
        (connected z14 z15 e)
        (connected z14 z19 s)

        (connected z15 z10 n)
        (connected z15 z14 w)

        (connected z16 z11 n)

        (connected z17 z12 n)
        (connected z17 z22 s)

        (connected z18 z13 n)

        (connected z19 z14 n)
        (connected z19 z24 s)

        (connected z20 z25 s)

        (connected z21 z22 e)

        (connected z22 z17 n)
        (connected z22 z21 w)

        (connected z23 z24 e)

        (connected z24 z19 n)
        (connected z24 z23 w)
        (connected z24 z25 e)

        (connected z25 z20 n)
        (connected z25 z24 w)

        ;-----------------------------------------------------
        ; Rooms where the NPCs are located
        ;-----------------------------------------------------

        (at z3 bruja)
        (at z9 princesa)
        (at z11 principe)
        (at z20 profesor)
        (at z21 diCaprio)


        ;-----------------------------------------------------
        ; Rooms where the objects are located
        ;-----------------------------------------------------

        (at z7 manzana)
        (at z10 rosa)
        (at z14 oscar)
        (at z12 algoritmo)
        (at z2 oro)

        ;-----------------------------------------------------
        ; Player status
        ;-----------------------------------------------------

        (at z13 jugador)
        (oriented jugador n)
        (hands-empty jugador)
    )

    (:goal
        (AND
            (supplied bruja)
            (supplied profesor)
            (supplied principe)
            (supplied diCaprio)
            (supplied princesa)
)))
