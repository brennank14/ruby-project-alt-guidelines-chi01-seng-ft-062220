Coach.destroy_all
Position.destroy_all
Player.destroy_all

Coach.create(name: "Matt Canada")
Coach.create(name: "James Daniel")
Coach.create(name: "Eddie Faulkner")
Coach.create(name: "Ike Hilliard")
Coach.create(name: "Shaun Sarret")
Coach.create(name: "Adrian Klemm")
Coach.create(name: "Randy Fitchner")

Position.create(name: "Center")
Position.create(name: "Offensive Guard")
Position.create(name: "Offensive Tackle")
Position.create(name: "Quarterback")
Position.create(name: "Running Back")
Position.create(name: "Wide Receiver")
Position.create(name: "Tight End")

Player.create(name:"James Conner")
Player.create(name: "Ben Roethlisberger")
Player.create(name: "Juju Smith-Schuster")
Player.create(name: "Eric Ebron")
Player.create(name: "Zach Banner")
Player.create(name: "Christian Montano")
Player.create(name: "John Keenoy")