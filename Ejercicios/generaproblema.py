import sys

# Funciones ------------------------------------------------------------------------------

def read_data_v1(data, objs, init, goal):
    objects = []
    players = []
    aux = []
    for line in data:
        orientacion = line[0]
        linea = line[5:]
        sep = linea.split()
        zonas = []
        for zona in sep:
            if zona[0] == 'z':
                zonas.append(zona[0:zona.index("[")])
                if zona[len(zona)-1] == "]":
                    corchetes = zona[zona.index("[")+1:len(zona)-1]
                else:
                    corchetes = zona[zona.index("[")+1:len(zona)]
                if len(corchetes) > 0:
                    obj = corchetes[corchetes.index("-")+1:]
                    name = corchetes[:corchetes.index("-")]
                    if name not in aux:
                        if obj in ["Princesa", "Principe", "Bruja", "Profesor", "Leonardo"]:
                            objects.append(name)
                        if obj == "Player":
                            players.append(name)
                        objs.append(name + " - " + obj)
                        aux.append(name)
                        init.append("(at " + zonas[-1] + " " + name + ")")

            else:
                corchetes = zona[:len(zona)-1]
                obj = corchetes[corchetes.index("-")+1:]
                name = corchetes[:corchetes.index("-")]
                if name not in aux:
                    if obj in ["Princesa", "Principe", "Bruja", "Profesor", "Leonardo"]:
                        objects.append(name)
                    if obj == "Player":
                        players.append(name)
                    objs.append(name + " - " + obj)
                    aux.append(name)
                    init.append("(at " + zonas[-1] + " " + name + ")")

        for i in range(len(zonas)-1):
            if orientacion == "V":
                init.append("(connected " + zonas[i] + " " + zonas[i+1] + " s)")
                init.append("(connected " + zonas[i+1] + " " + zonas[i] + " n)")
            elif orientacion == "H":
                init.append("(connected " + zonas[i] + " " + zonas[i+1] + " e)")
                init.append("(connected " + zonas[i+1] + " " + zonas[i] + " w)")

    objs.append("n s e w - orientation")

    for player in players:
        init.append("(hands-empty " + player + ")")
        init.append("(oriented " + player + " n)")

    for NPC in objects:
        goal.append("(supplied " + NPC + ")")

def read_data_v2(data, objs, init, goal):
    objects = []
    players = []
    aux = []
    for line in data:
        orientacion = line[0]
        linea = line[5:]
        sep = linea.split('=')
        zonas = []
        distancias = []
        for zona in sep:
            if zona[0] == 'z':
                zonas.append(zona[0:zona.index("[")])
                corchetes = zona[zona.index("[")+1:zona.index("]")]
                if len(corchetes) > 0:
                    objetos = corchetes.split()
                    for o in objetos:
                        obj = o[o.index("-")+1:]
                        name = o[:o.index("-")]
                        if name not in aux:
                            if obj in ["Princesa", "Principe", "Bruja", "Profesor", "Leonardo"]:
                                objects.append(name)
                            if obj == "Player":
                                players.append(name)
                            objs.append(name + " - " + obj)
                            aux.append(name)
                            init.append("(at " + zonas[-1] + " " + name + ")")

            else:
                distancias.append(int(zona))

        for i in range(len(zonas)-1):
            if orientacion == "V":
                init.append("(connected " + zonas[i] + " " + zonas[i+1] + " s) (= (distance " + zonas[i] + " " + zonas[i+1] + ") " + str(distancias[i]) + ")")
                init.append("(connected " + zonas[i+1] + " " + zonas[i] + " n) (= (distance " + zonas[i+1] + " " + zonas[i] + ") " +str(distancias[i]) + ")")
            elif orientacion == "H":
                init.append("(connected " + zonas[i] + " " + zonas[i+1] + " e) (= (distance " + zonas[i] + " " + zonas[i+1] + ") " + str(distancias[i]) + ")")
                init.append("(connected " + zonas[i+1] + " " + zonas[i] + " w) (= (distance " + zonas[i+1] + " " + zonas[i] + ") " + str(distancias[i]) + ")")

    objs.append("n s e w - orientation")

    for player in players:
        init.append("(hands-empty " + player + ")")
        init.append("(oriented " + player + " n)")

    for NPC in objects:
        goal.append("(supplied " + NPC + ")")

    init.append("(= (total-cost) 0)")

def read_data_v3(data, objs, init, goal):
    objects = []
    players = []
    aux = []
    aux2 = []
    bosque, agua, precipicio, arena, piedra = [], [], [], [], []
    for line in data:
        orientacion = line[0]
        linea = line[5:]
        sep = linea.split('=')
        zonas = []
        distancias = []
        for zona in sep:
            if zona[0] == 'z':
                zona_i = zona[0:zona.index("[")]
                zonas.append(zona_i)
                corchetes = zona[zona.index("[")+1:zona.index("]")]
                superficie = zona[zona.index("]")+2:len(zona)-1]
                if zona_i not in aux2:
                    if superficie.startswith("Bosque"):
                        bosque.append(zona_i)
                        aux2.append(zona_i)
                    elif superficie.startswith("Agua"):
                        agua.append(zona_i)
                        aux2.append(zona_i)
                    elif superficie.startswith("Precipicio"):
                        precipicio.append(zona_i)
                        aux2.append(zona_i)
                    elif superficie.startswith("Arena"):
                        arena.append(zona_i)
                        aux2.append(zona_i)
                    elif superficie.startswith("Piedra"):
                        piedra.append(zona_i)
                        aux2.append(zona_i)
                if len(corchetes) > 0:
                    objetos = corchetes.split()
                    for o in objetos:
                        obj = o[o.index("-")+1:]
                        name = o[:o.index("-")]
                        if name not in aux:
                            if obj in ["Princesa", "Principe", "Bruja", "Profesor", "Leonardo"]:
                                objects.append(name)
                            if obj == "Player":
                                players.append(name)
                            objs.append(name + " - " + obj)
                            aux.append(name)
                            init.append("(at " + zonas[-1] + " " + name + ")")
                            if obj == "Zapatilla":
                                init.append("(is-sneaker " + name + ")")
                            elif obj == "Bikini":
                                init.append("(is-bikini " + name + ")")

            else:
                distancias.append(int(zona))

        for i in range(len(zonas)-1):
            if orientacion == "V":
                init.append("(connected " + zonas[i] + " " + zonas[i+1] + " s) (= (distance " + zonas[i] + " " + zonas[i+1] + ") " + str(distancias[i]) + ")")
                init.append("(connected " + zonas[i+1] + " " + zonas[i] + " n) (= (distance " + zonas[i+1] + " " + zonas[i] + ") " +str(distancias[i]) + ")")
            elif orientacion == "H":
                init.append("(connected " + zonas[i] + " " + zonas[i+1] + " e) (= (distance " + zonas[i] + " " + zonas[i+1] + ") " + str(distancias[i]) + ")")
                init.append("(connected " + zonas[i+1] + " " + zonas[i] + " w) (= (distance " + zonas[i+1] + " " + zonas[i] + ") " + str(distancias[i]) + ")")

    objs.append("n s e w - orientation")
    aux = ""
    if len(bosque) > 0:
        for z in bosque:
            aux += (z + " ")
            init.append("(is-forest " + z + ")")
        objs.append(aux + "- Bosque")
    aux = ""
    if len(agua) > 0:
        for z in agua:
            aux += (z + " ")
            init.append("(is-water " + z + ")")
        objs.append(aux + "- Agua")
    aux = ""
    if len(precipicio) > 0:
        for z in precipicio:
            aux += (z + " ")
        objs.append(aux + "- Precipicio")
    aux = ""
    if len(arena) > 0:
        for z in arena:
            aux += (z + " ")
        objs.append(aux + "- Arena")
    aux = ""
    if len(piedra) > 0:
        for z in piedra:
            aux += (z + " ")
        objs.append(aux + "- Piedra")

    for player in players:
        init.append("(hands-empty " + player + ")")
        init.append("(bag-empty " + player + ")")
        init.append("(oriented " + player + " n)")
    init.append("(= (total-cost) 0)")

    for NPC in objects:
        goal.append("(supplied " + NPC + ")")

def read_data_v4(data, objs, init, goal, min_score, ejer, pts):
    objects = []
    players = []
    if ejer == 7:
        dealer, picker = [], []
    aux = []
    aux2 = []
    bosque, agua, precipicio, arena, piedra = [], [], [], [], []
    leonardo, princesa, bruja, profesor, principe = [], [], [], [], []
    oscar, rosa, manzana, algoritmo, oro = [], [], [], [], []
    for line in data:
        orientacion = line[0]
        linea = line[5:]
        sep = linea.split('=')
        zonas = []
        distancias = []
        for zona in sep:
            if zona[0] == 'z':
                zona_i = zona[0:zona.index("[")]
                zonas.append(zona_i)
                corchetes = zona[zona.index("[")+1:zona.index("]")]
                superficie = zona[zona.index("]")+2:len(zona)-1]
                if zona_i not in aux2:
                    if superficie.startswith("Bosque"):
                        bosque.append(zona_i)
                        aux2.append(zona_i)
                    elif superficie.startswith("Agua"):
                        agua.append(zona_i)
                        aux2.append(zona_i)
                    elif superficie.startswith("Precipicio"):
                        precipicio.append(zona_i)
                        aux2.append(zona_i)
                    elif superficie.startswith("Arena"):
                        arena.append(zona_i)
                        aux2.append(zona_i)
                    elif superficie.startswith("Piedra"):
                        piedra.append(zona_i)
                        aux2.append(zona_i)
                if len(corchetes) > 0:
                    objetos = corchetes.split()
                    for o in objetos:
                        obj = o[o.index("-")+1:]
                        name = o[:o.index("-")]
                        if name not in aux:
                            if obj == "Leonardo":
                                leonardo.append(name)
                            elif obj == "Princesa":
                                princesa.append(name)
                            elif obj == "Bruja":
                                bruja.append(name)
                            elif obj == "Profesor":
                                profesor.append(name)
                            elif obj == "Principe":
                                principe.append(name)
                            elif obj == "Oscar":
                                oscar.append(name)
                            elif obj == "Rosa":
                                rosa.append(name)
                            elif obj == "Manzana":
                                manzana.append(name)
                            elif obj == "Algoritmo":
                                algoritmo.append(name)
                            elif obj == "Oro":
                                oro.append(name)
                            elif obj == "Player":
                                players.append(name)
                            elif obj == "Dealer":
                                dealer.append(name)
                            elif obj == "Picker":
                                picker.append(name)
                            objs.append(name + " - " + obj)
                            aux.append(name)
                            init.append("(at " + zonas[-1] + " " + name + ")")
                            if obj == "Zapatilla":
                                init.append("(is-sneaker " + name + ")")
                            elif obj == "Bikini":
                                init.append("(is-bikini " + name + ")")

            else:
                distancias.append(int(zona))

        for i in range(len(zonas)-1):
            if orientacion == "V":
                init.append("(connected " + zonas[i] + " " + zonas[i+1] + " s) (= (distance " + zonas[i] + " " + zonas[i+1] + ") " + str(distancias[i]) + ")")
                init.append("(connected " + zonas[i+1] + " " + zonas[i] + " n) (= (distance " + zonas[i+1] + " " + zonas[i] + ") " +str(distancias[i]) + ")")
            elif orientacion == "H":
                init.append("(connected " + zonas[i] + " " + zonas[i+1] + " e) (= (distance " + zonas[i] + " " + zonas[i+1] + ") " + str(distancias[i]) + ")")
                init.append("(connected " + zonas[i+1] + " " + zonas[i] + " w) (= (distance " + zonas[i+1] + " " + zonas[i] + ") " + str(distancias[i]) + ")")

    objs.append("n s e w - orientation")
    aux = ""
    if len(bosque) > 0:
        for z in bosque:
            aux += (z + " ")
            init.append("(is-forest " + z + ")")
        objs.append(aux + "- Bosque")
    aux = ""
    if len(agua) > 0:
        for z in agua:
            aux += (z + " ")
            init.append("(is-water " + z + ")")
        objs.append(aux + "- Agua")
    aux = ""
    if len(precipicio) > 0:
        for z in precipicio:
            aux += (z + " ")
        objs.append(aux + "- Precipicio")
    aux = ""
    if len(arena) > 0:
        for z in arena:
            aux += (z + " ")
        objs.append(aux + "- Arena")
    aux = ""
    if len(piedra) > 0:
        for z in piedra:
            aux += (z + " ")
        objs.append(aux + "- Piedra")

    if ejer < 7:
        for player in players:
            init.append("(hands-empty " + player + ")")
            init.append("(bag-empty " + player + ")")
            init.append("(oriented " + player + " n)")
            if ejer == 6:
                init.append("(= (total-player-score " + player + ") 0)")
    else:
        players += dealer
        players += picker
        for player in players:
            init.append("(hands-empty " + player + ")")
            init.append("(bag-empty " + player + ")")
            init.append("(oriented " + player + " n)")
        for player in dealer:
            init.append("(= (total-player-score " + player + ") 0)")

    # Tabla de puntos
    if len(leonardo) > 0:
        for n in leonardo:
            if len(oscar) > 0:
                for o in oscar:
                    init.append("(= (score " + o + " " + n + ") 10)")
            if len(rosa) > 0:
                for o in rosa:
                    init.append("(= (score " + o + " " + n + ") 1)")
            if len(manzana) > 0:
                for o in manzana:
                    init.append("(= (score " + o + " " + n + ") 3)")
            if len(algoritmo) > 0:
                for o in algoritmo:
                    init.append("(= (score " + o + " " + n + ") 4)")
            if len(oro) > 0:
                for o in oro:
                    init.append("(= (score " + o + " " + n + ") 5)")
    if len(princesa) > 0:
        for n in princesa:
            if len(oscar) > 0:
                for o in oscar:
                    init.append("(= (score " + o + " " + n + ") 5)")
            if len(rosa) > 0:
                for o in rosa:
                    init.append("(= (score " + o + " " + n + ") 10)")
            if len(manzana) > 0:
                for o in manzana:
                    init.append("(= (score " + o + " " + n + ") 1)")
            if len(algoritmo) > 0:
                for o in algoritmo:
                    init.append("(= (score " + o + " " + n + ") 3)")
            if len(oro) > 0:
                for o in oro:
                    init.append("(= (score " + o + " " + n + ") 4)")
    if len(bruja) > 0:
        for n in bruja:
            if len(oscar) > 0:
                for o in oscar:
                    init.append("(= (score " + o + " " + n + ") 4)")
            if len(rosa) > 0:
                for o in rosa:
                    init.append("(= (score " + o + " " + n + ") 5)")
            if len(manzana) > 0:
                for o in manzana:
                    init.append("(= (score " + o + " " + n + ") 10)")
            if len(algoritmo) > 0:
                for o in algoritmo:
                    init.append("(= (score " + o + " " + n + ") 1)")
            if len(oro) > 0:
                for o in oro:
                    init.append("(= (score " + o + " " + n + ") 3)")
    if len(profesor) > 0:
        for n in profesor:
            if len(oscar) > 0:
                for o in oscar:
                    init.append("(= (score " + o + " " + n + ") 3)")
            if len(rosa) > 0:
                for o in rosa:
                    init.append("(= (score " + o + " " + n + ") 4)")
            if len(manzana) > 0:
                for o in manzana:
                    init.append("(= (score " + o + " " + n + ") 5)")
            if len(algoritmo) > 0:
                for o in algoritmo:
                    init.append("(= (score " + o + " " + n + ") 10)")
            if len(oro) > 0:
                for o in oro:
                    init.append("(= (score " + o + " " + n + ") 1)")
    if len(principe) > 0:
        for n in principe:
            if len(oscar) > 0:
                for o in oscar:
                    init.append("(= (score " + o + " " + n + ") 1)")
            if len(rosa) > 0:
                for o in rosa:
                    init.append("(= (score " + o + " " + n + ") 3)")
            if len(manzana) > 0:
                for o in manzana:
                    init.append("(= (score " + o + " " + n + ") 4)")
            if len(algoritmo) > 0:
                for o in algoritmo:
                    init.append("(= (score " + o + " " + n + ") 5)")
            if len(oro) > 0:
                for o in oro:
                    init.append("(= (score " + o + " " + n + ") 10)")


    init.append("(= (total-cost) 0)")
    init.append("(= (total-score) 0)")
    goal.append("(>= (total-score) " + min_score + ")")
    if ejer >= 6:
        for p in pts:
            goal.append("(>= (total-player-score " + p[:p.index(":")] + ") " + p[p.index(":")+1:] + ")")

# -----------------------------------------------------------------------------------------

if len(sys.argv) == 3:
    f_in = open(sys.argv[1])
    f_out = open(sys.argv[2], "w")
else:
    print("ERROR: debe indicar el fichero de entrada y de salida")
    sys.exit()

print("Generendo fichero..." + sys.argv[2])

# Dominio
linea = f_in.readline()
ej = int(linea[len(linea)-2])

# Nombre del problema
linea = f_in.readline()
problem_name = linea[linea.index(':')+1:len(linea)-1]

print("Ejercicio " + str(ej) + ", " + problem_name)
objs = []
init = []
goal = []

# escribimos problem y domain
f_out.write("(define (problem " + problem_name + ")\n\n")
f_out.write("(:domain Ejercicio" + str(ej) + ")\n\n")

# objects e init
pts = []
linea = f_in.readline()  # numero de zonas

if ej < 3:
    n_zonas = int(linea[linea.index(":")+1:len(linea)-1])
    zonas = ""
    for x in range(n_zonas):
        zonas += ("z" + str(x+1) + " ")
    zonas += "- zone"
    objs.append(zonas)

elif ej > 5:
    if ej == 7:
        linea = f_in.readline() # numero de jugadores
    linea = f_in.readline()  # bolsillo
    corchetes = linea[linea.index("[")+1:linea.index("]")]
    pockets = corchetes.split()
    for p in pockets:
        init.append("(= (pocket-space " + p[:p.index(":")] + ") " + p[p.index(":")+1:] + ")")
    linea = f_in.readline()  # puntos totales
    min_score = linea[linea.index(':')+1:len(linea)-1]
    linea = f_in.readline()  # puntos de cada jugador
    corchetes = linea[linea.index("[")+1:linea.index("]")]
    pts = corchetes.split()

elif ej > 4:
    linea = f_in.readline()  # bolsillo
    corchetes = linea[linea.index("[")+1:linea.index("]")]
    pockets = corchetes.split()
    for p in pockets:
        init.append("(= (pocket-space " + p[:p.index(":")] + ") " + p[p.index(":")+1:] + ")")
    linea = f_in.readline()  # puntos totales
    min_score = linea[linea.index(':')+1:len(linea)-1]

elif ej > 3:
    linea = f_in.readline()  # puntos totales
    min_score = linea[linea.index(':')+1:len(linea)-1]


# Leemos el resto del archivo
data = f_in.readlines()
if ej == 1:
    read_data_v1(data, objs, init, goal)
elif ej == 2:
    read_data_v2(data, objs, init, goal)
elif ej == 3:
    read_data_v3(data, objs, init, goal)
elif ej == 4:
    read_data_v4(data, objs, init, goal, min_score, 4, pts)
elif ej == 5:
    read_data_v4(data, objs, init, goal, min_score, 5, pts)
elif ej == 6:
    read_data_v4(data, objs, init, goal, min_score, 6, pts)
elif ej == 7:
    read_data_v4(data, objs, init, goal, min_score, 7, pts)

# escribimos objects
f_out.write("(:objects\n")
for linea in objs:
    f_out.write("    " + linea + "\n")

# escribimos init
f_out.write(")\n\n(:init\n")
for linea in init:
    f_out.write("    " + linea + "\n")

# escribimos goal
f_out.write(")\n\n(:goal (AND\n")
for linea in goal:
    f_out.write("    " + linea + "\n")

f_out.write("))\n\n")
f_out.write("(:metric minimize (total-cost)))")

f_out.close()
