#encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

mating = Game.create name: "Parecidos"
memo_test = Game.create name: "Memo Test"
sequence = Game.create name: "Secuencia"

#TODO: Averiguar duraciones estimadas

mating_level_1 = mating.levels.create name: "Objetos Idénticos", order: 1, duration: 5
mating_level_2 = mating.levels.create name: "Objetos No Idénticos", order: 2, duration: 10
mating_level_3 = mating.levels.create name: "Figura y Fondo", order: 3, duration: 15
mating_level_4 = mating.levels.create name: "Parte y Todo", order: 4, duration: 20
mating_level_5 = mating.levels.create name: "Asociación", order: 5, duration: 25





