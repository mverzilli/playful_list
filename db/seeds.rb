#encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or create!d alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

mating = Game.create! name: "Parecidos"
sequence = Game.create! name: "Secuencia"

#TODO: Averiguar duraciones estimadas


mating_level_1 = mating.levels.create! name: "Objetos Idénticos", order: 1, duration: 500, repetitions: 2
mating_level_2 = mating.levels.create! name: "Objetos No Idénticos", order: 2, duration: 1000, repetitions: 1
mating_level_3 = mating.levels.create! name: "Figura y Fondo", order: 3, duration: 1500, repetitions: 1
mating_level_4 = mating.levels.create! name: "Parte y Todo", order: 4, duration: 2000, repetitions: 1
mating_level_5 = mating.levels.create! name: "Asociación", order: 5, duration: 2500, repetitions: 1

sequence_level_1 = sequence.levels.create! name: "2 elementos", order: 1, duration: 500, repetitions: 1
sequence_level_2 = sequence.levels.create! name: "3 elementos", order: 3, duration: 1500, repetitions: 3

choice1 = Choice.create image: "circle.jpg", group: "shapes"
choice2 = Choice.create image: "square.jpg", group: "shapes"
choice3 = Choice.create image: "triangle.jpg", group: "shapes"

Choice.create image: "lapiz.png", group: "utiles"
Choice.create image: "goma de borrar.png", group: "utiles"
Choice.create image: "pincel.png", group: "utiles"
Choice.create image: "sacapuntas.png", group: "utiles"
Choice.create image: "carpeta.png", group: "utiles"

Choice.create image: "manzana.png", group: "frutas"
Choice.create image: "naranja.png", group: "frutas"
Choice.create image: "limon.png", group: "frutas"
Choice.create image: "uvas.png", group: "frutas"
Choice.create image: "banana.png", group: "frutas"

Choice.create image: "auto-conductor.png", group: "transportes"
Choice.create image: "avion-2.png", group: "transportes"
Choice.create image: "barco.png", group: "transportes"
Choice.create image: "tren.png", group: "transportes"
Choice.create image: "cohete.png", group: "transportes"

arbol = Choice.create! image: 'arbol.png'
zapatilla = Choice.create! image: 'zapatilla.png'
tren1 = Choice.create! image: 'tren-1.png'
vaso = Choice.create! image: 'vaso.png'
perro4 = Choice.create! image: 'perro-4.png'

pino = Choice.create! image: 'pino.png'
zapatos = Choice.create! image: 'zapatos.png'
tren2 = Choice.create! image: 'tren-2.png'
copa = Choice.create! image: 'copa.png'
perro5 = Choice.create! image: 'perro-5.png'

Question.create question: arbol, answer: pino, level_id: mating_level_2.id

Question.create question: zapatilla, answer: zapatos, level_id: mating_level_2.id
Question.create question: tren1, answer: tren2, level_id: mating_level_2.id
Question.create question: vaso, answer: copa, level_id: mating_level_2.id
Question.create question: perro4, answer: perro5, level_id: mating_level_2.id

arbolcolor = Choice.create! image: 'arbol-color.png'
casa = Choice.create! image: 'casa.png'
pelota = Choice.create! image: 'pelota.png'
manzana2 = Choice.create! image: 'manzana-2.png'
sol = Choice.create! image: 'sol.png'

arbolnegro = Choice.create! image: 'arbol-negro.png'
casanegra = Choice.create! image: 'casa-negra.png'
pelotanegra = Choice.create! image: 'pelota-negra.png'
manzananegra = Choice.create! image: 'manzana negra.png'
solnegro = Choice.create! image: 'sol-negro.png'

Question.create question: arbolcolor, answer: arbolnegro, level_id: mating_level_3.id
Question.create question: casa, answer: casanegra, level_id: mating_level_3.id
Question.create question: pelota, answer: pelotanegra, level_id: mating_level_3.id
Question.create question: manzana2, answer: manzananegra, level_id: mating_level_3.id
Question.create question: sol, answer: solnegro, level_id: mating_level_3.id

mono = Choice.create! image: 'mono.png'
caballo = Choice.create! image: 'caballo.png'
perro = Choice.create! image: 'perro.png'
gatito = Choice.create! image: 'gatito.png'
tortuga = Choice.create! image: 'tortuga.png'
ardilla = Choice.create! image: 'ardilla.png'
pajaros = Choice.create! image: 'pajaros.png'

banana2 = Choice.create! image: 'banana-2.png'
pasto = Choice.create! image: 'pasto.png'
hueso = Choice.create! image: 'hueso.png'
pescado = Choice.create! image: 'pescado.png'
lechuga = Choice.create! image: 'lechuga.png'
zanhoria = Choice.create! image: 'zanhoria.png'
semillas = Choice.create! image: 'semillas.png'

Question.create question: mono, answer: banana2, level_id: mating_level_5.id
Question.create question: caballo, answer: pasto, level_id: mating_level_5.id
Question.create question: perro, answer: hueso, level_id: mating_level_5.id
Question.create question: gatito, answer: pescado, level_id: mating_level_5.id
Question.create question: tortuga, answer: lechuga, level_id: mating_level_5.id
Question.create question: ardilla, answer: zanhoria, level_id: mating_level_5.id
Question.create question: pajaros, answer: semillas, level_id: mating_level_5.id

locomotora = Choice.create! image: 'locomotora.png'
auto2 = Choice.create! image: 'auto-2.png'
avion3 = Choice.create! image: 'avion-3.png'
velero = Choice.create! image: 'velero.png'
helicoptero = Choice.create! image: 'helicoptero.png'
barco2 = Choice.create! image: 'barco-2.png'

vias = Choice.create! image: 'vias.png'
ruta = Choice.create! image: 'ruta.png'
cielo = Choice.create! image: 'cielo.png'
mar = Choice.create! image: 'mar.png'
cielo = Choice.create! image: 'cielo.png'
mar = Choice.create! image: 'mar.png'

Question.create question: locomotora, answer: vias, level_id: mating_level_4.id
Question.create question: auto2, answer: ruta, level_id: mating_level_4.id
Question.create question: avion3, answer: cielo, level_id: mating_level_4.id
Question.create question: velero, answer: mar, level_id: mating_level_4.id
Question.create question: helicoptero, answer: cielo, level_id: mating_level_4.id
Question.create question: barco2, answer: mar, level_id: mating_level_4.id


dentifrico = Choice.create! image: 'dentifrico.png'
vaso1 = Choice.create! image: 'vaso-1.png'
lapiz = Choice.create! image: 'lapiz.png'
tempera = Choice.create! image: 'tempera.png'
perro2 = Choice.create! image: 'perro-2.png'
cerradura = Choice.create! image: 'cerradura.png'

cepillo = Choice.create! image: 'cepillo.png'
plato = Choice.create! image: 'plato.png'
sacapuntas = Choice.create! image: 'sacapuntas.png'
pincel2 = Choice.create! image: 'pincel-2.png'
cucha = Choice.create! image: 'cucha.png'
llave = Choice.create! image: 'llave.png'

Question.create question: dentifrico, answer: cepillo, level_id: mating_level_5.id
Question.create question: vaso1, answer: plato, level_id: mating_level_5.id
Question.create question: lapiz, answer: sacapuntas, level_id: mating_level_5.id
Question.create question: tempera, answer: pincel2, level_id: mating_level_5.id
Question.create question: perro2, answer: cucha, level_id: mating_level_5.id
Question.create question: cerradura, answer: llave, level_id: mating_level_5.id
