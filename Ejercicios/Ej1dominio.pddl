;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Ejercicio 1 - Práctica 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain Ejercicio1)
  (:requirements :strips :equality :typing)

  (:types
    character item - locatable
    Player NPC - character
    Oscar Manzana Rosa Algoritmo Oro - item
    Princesa Principe Bruja Profesor Leonardo - NPC
    zone
    orientation
    )

  (:predicates
    (connected ?x ?y - zone ?z - orientation); true si 'x' e 'y' están conectadas en la orientación 'z'
    (oriented ?x - Player ?y - orientation); true si el jugador 'x' está orientado según 'y'
    (at ?x - zone ?y - locatable); true si 'y' está en la zona 'x'
    (has-object ?x - Player ?y - item); true si el jugador 'x' tiene el objeto 'y'
    (hands-empty ?x - Player); true si el jugador 'x' puede coger un objeto
    (supplied ?x - NPC); true si el NPC 'x' tiene ya un objeto
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
     :precondition (and (oriented ?p ?z) (at ?x ?p) (connected ?x ?y ?z))
     :effect (and (not (at ?x ?p)) (at ?y ?p))
   )

   (:action pick-up; Coger un item
     :parameters (?p - Player ?o - item ?z - zone)
     :precondition (and (at ?z ?p) (at ?z ?o) (hands-empty ?p))
     :effect (and (not (hands-empty ?p)) (has-object ?p ?o) (not (at ?z ?o)))
   )

   (:action drop; Dejar un item
     :parameters (?p - Player ?o - item ?z - zone)
     :precondition (and (at ?z ?p) (has-object ?p ?o))
     :effect (and (not (has-object ?p ?o)) (hands-empty ?p) (at ?z ?o))
   )

   (:action give; Entregar un item a un personaje
     :parameters (?p - Player ?o - item ?z - zone ?n - NPC)
     :precondition (and (at ?z ?p) (at ?z ?n) (has-object ?p ?o))
     :effect(and (not (has-object ?p ?o)) (hands-empty ?p) (supplied ?n))
   )
)
