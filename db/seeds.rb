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

jconner = Player.create(name:"James Conner", position_id: rb.id, coach_id: eddie.id, number: 30)
bigben = Player.create(name: "Ben Roethlisberger", position_id: qb.id, coach_id: matt.id, number: 7)
juju = Player.create(name: "Juju Smith-Schuster", position_id: wr.id, coach_id: ike.id, number: 19)
eebron = Player.create(name: "Eric Ebron", position_id: te.id, coach_id: jdaniel.id, number: 85)
zbanner = Player.create(name: "Zach Banner", position_id: ot.id, coach_id: shuan.id, number: 72)
cmontano = Player.create(name: "Christian Montano", position_id: og.id, coach_id: adrian.id, number: 62)
jkeenoy = Player.create(name: "John Keenoy", position_id: center.id, coach_id: adrian, number: 64)