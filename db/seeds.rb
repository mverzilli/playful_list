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

sequence_level_1 = sequence.levels.create! name: "2 elementos de distintas formas", order: 1, duration: 500, repetitions: 1
sequence_level_2 = sequence.levels.create! name: "2 elementos de distintos colores", order: 2, duration: 1000, repetitions: 1
sequence_level_3 = sequence.levels.create! name: "3 elementos", order: 3, duration: 1500, repetitions: 3
sequence_level_4 = sequence.levels.create! name: "3 elementos de distintos colores", order: 4, duration: 2000, repetitions: 1

choice1 = Choice.create image: "circle.jpg", group: "shapes"
choice2 = Choice.create image: "square.jpg", group: "shapes"
choice3 = Choice.create image: "triangle.jpg", group: "shapes"


