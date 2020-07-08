require_relative '../config/environment'
require 'pry'

Coach.destroy_all
Position.destroy_all
Player.destroy_all

matt = Coach.create(name: "Matt Canada")
jdaniel = Coach.create(name: "James Daniel")
eddie = Coach.create(name: "Eddie Faulkner")
ike = Coach.create(name: "Ike Hilliard")
shuan = Coach.create(name: "Shaun Sarret")
adrian = Coach.create(name: "Adrian Klemm")
randy = Coach.create(name: "Randy Fitchner")

center = Position.create(name: "Center")
og = Position.create(name: "Offensive Guard")
ot = Position.create(name: "Offensive Tackle")
qb = Position.create(name: "Quarterback")
rb = Position.create(name: "Running Back")
wr = Position.create(name: "Wide Receiver")
te = Position.create(name: "Tight End")

jconner = Player.create(name:"James Conner", position: rb, coach: eddie, number: 30)
bigben = Player.create(name: "Ben Roethlisberger", position: qb, coach: matt, number: 7)
juju = Player.create(name: "Juju Smith-Schuster", position: wr, coach: ike, number: 19)
eebron = Player.create(name: "Eric Ebron", position: te, coach: jdaniel, number: 85)
zbanner = Player.create(name: "Zach Banner", position: ot, coach: shuan, number: 72)
cmontano = Player.create(name: "Christian Montano", position: og, coach: adrian, number: 62)
jkeenoy = Player.create(name: "John Keenoy", position: center, coach: adrian, number: 64)
kathleen = Player.create(name: "Kathleen", position: center, coach: adrian, number: 64)

