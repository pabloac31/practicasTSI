;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Ejercicio 5 - Práctica 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain Ejercicio5)
  (:requirements :strips :equality :typing :fluents :adl)
  (:types
    character item - locatable
    Player NPC - character
    Oscar Manzana Rosa Algoritmo Oro Zapatilla Bikini - item
    Princesa Principe Bruja Profesor Leonardo - NPC
    Bosque Agua Precipicio Arena Piedra - zone
    orientation
    )

  (:predicates
    (connected ?x ?y - zone ?z - orientation); true si 'x' e 'y' están conectadas en la orientación 'z'
    (oriented ?x - Player ?y - orientation); true si el jugador 'x' está orientado según 'y'
    (at ?x - zone ?y - locatable); true si 'y' está en la zona 'x'
    (has-object ?x - Player ?y - item); true si el jugador 'x' tiene el objeto 'y' en las manos
    (hands-empty ?x - Player); true si el jugador 'x' puede coger un objeto
    (supplied ?x - NPC); true si el NPC 'x' tiene ya un objeto
    (bag-empty ?x - Player); true si el jugador 'x' tiene la mochila vacía
    (in-bag ?x - Player ?y - item); true si el jugador 'x' tiene el objeto 'y' en la mochila
    (is-sneaker ?x - item); true si el objeto 'x' es una zapatilla
    (is-bikini ?x - item); true si el objeto 'x' es un bikini
    (is-forest ?x - zone); true si la zona 'x' es bosque
    (is-water ?x - zone); true si la zona 'x' es agua
    (is-cliff ?x - zone); true si la zona 'x' es un precipicio
    (sneakers ?x - Player); true si el jugador 'x' tiene unas zapatillas
    (bikini ?x - Player); true si el jugador 'x' tiene un bikini
    )

  (:functions
    (distance ?x ?y - zone); distancia desde la zona 'x' a la 'y'
    (total-cost); distancia total del plan
    (score ?x - item ?y - NPC); puntuación obtenida al entregar el item 'x' al personaje 'y'
    (total-score); puntuación total del jugador
    (pocket-space ?x - NPC); espacio restante en el bolsillo del personaje 'x'
    )


    (:action turn-left; Girar a la izquierda
      :parameters (?p - Player ?z - orientation)
      :precondition (oriented ?p ?z)
      :effect (and
                (when (= ?z n) (and (not(oriented ?p n)) (oriented ?p w)))
                (when (= ?z e) (and (not(oriented ?p e)) (oriented ?p n)))
                (when (= ?z s) (and (not(oriented ?p s)) (oriented ?p e)))
                (when (= ?z w) (and (not(oriented ?p w)) (oriented ?p s)))
              )
    )

    (:action turn-right; Girar a la derecha
      :parameters (?p - Player ?z - orientation)
      :precondition (oriented ?p ?z)
      :effect (and
                (when (= ?z n) (and (not(oriented ?p n))(oriented ?p e)))
                (when (= ?z e) (and (not(oriented ?p e))(oriented ?p s)))
                (when (= ?z s) (and (not(oriented ?p s))(oriented ?p w)))
                (when (= ?z w) (and (not(oriented ?p w))(oriented ?p n)))
              )
    )

     (:action go; Moverse entre zonas
       :parameters (?p - Player ?z - orientation ?x ?y - zone)
       :precondition (OR
         (AND (oriented ?p ?z) (at ?x ?p) (connected ?x ?y ?z) (not(is-forest ?y)) (not(is-water ?y)) (not(is-cliff ?y)))
         (AND (oriented ?p ?z) (at ?x ?p) (connected ?x ?y ?z) (is-forest ?y) (sneakers ?p))
         (AND (oriented ?p ?z) (at ?x ?p) (connected ?x ?y ?z) (is-water ?y) (bikini ?p)))
       :effect (and (not (at ?x ?p)) (at ?y ?p) (increase (total-cost) (distance ?x ?y)))
     )

     (:action pick-up; Coger un item
       :parameters (?p - Player ?o - item ?z - zone)
       :precondition (and (at ?z ?p) (at ?z ?o) (hands-empty ?p))
       :effect (AND (not (hands-empty ?p)) (has-object ?p ?o) (not (at ?z ?o))
          (WHEN(is-sneaker ?o) (sneakers ?p)) (WHEN(is-bikini ?o) (bikini ?p)))
     )

     (:action drop; Dejar un item
       :parameters (?p - Player ?o - item ?z - zone)
       :precondition (and (at ?z ?p) (has-object ?p ?o))
       :effect (AND (not (has-object ?p ?o)) (hands-empty ?p) (at ?z ?o)
          (WHEN(is-sneaker ?o) (not(sneakers ?p))) (WHEN(is-bikini ?o) (not(bikini ?p))))
     )

     (:action put-in-bag; Guardar un item en la mochila
       :parameters (?p - Player ?o - item)
       :precondition (and (has-object ?p ?o) (bag-empty ?p))
       :effect (and (not(bag-empty ?p)) (in-bag ?p ?o) (not(has-object ?p ?o)) (hands-empty ?p))
     )

     (:action take-out-bag; Sacar un item de la mochila
       :parameters (?p - Player ?o - item)
       :precondition (and (hands-empty ?p) (in-bag ?p ?o))
       :effect (and (not (in-bag ?p ?o)) (bag-empty ?p) (has-object ?p ?o) (not(hands-empty ?p)))
     )

     (:action give; Entregar un item a un personaje
       :parameters (?p - Player ?o - item ?z - zone ?n - NPC)
       :precondition (and (at ?z ?p) (at ?z ?n) (has-object ?p ?o) (not(is-bikini ?o)) (not(is-sneaker ?o)) (> (pocket-space ?n) 0))
       :effect(and (not(has-object ?p ?o)) (hands-empty ?p) (increase (total-score) (score ?o ?n)) (decrease (pocket-space ?n) 1) (supplied ?n))
     )
    )
