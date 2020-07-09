require_relative '../config/environment'
require 'pry'

Coach.destroy_all
Position.destroy_all
Player.destroy_all

mike = Coach.create(name: "Mike Tomlin")        #head coach
john = Coach.create(name: "John Mitchell")      #assist. head coach
randy = Coach.create(name: "Randy Fitchner")    #offensive coordinator
matt = Coach.create(name: "Matt Canada")        #QB
jdaniel = Coach.create(name: "James Daniel")    #TE
eddie = Coach.create(name: "Eddie Faulkner")    #RB
ike = Coach.create(name: "Ike Hilliard")        #WR
shuan = Coach.create(name: "Shaun Sarret")      #OL
adrian = Coach.create(name: "Adrian Klemm")     #OL Assist
kbutler = Coach.create(name: "Keith Butler")    #Defensive coord
taustin = Coach.create(name: "Teryl Austin")    #Secondary Defensive coord
tbradley = Coach.create(name: "Tom Bradley")    #defensive backs coach
kdunbar = Coach.create(name: "Karl Dunbar")     #defensive line coach
jolsavsky = Coach.create(name: "Jerry Olsavsky")    #inline linebackers

Position.create(name: "Center", abbv: "C")
Position.create(name: "Offensive Guard", abbv: "OG")
Position.create(name: "Offensive Tackle", abbv: "OT")
Position.create(name: "Quarterback", abbv: "QB")
Position.create(name: "Running Back", abbv: "RB")
Position.create(name: "Wide Receiver", abbv: "WR")
Position.create(name: "Tight End", abbv: "TE")
Position.create(name: "Safety", abbv: "S")
Position.create(name: "Kicker", abbv: "K")
Position.create(name: "Punter", abbv: "P")
Position.create(name: "Line Backer", abbv: "LB")
Position.create(name: "Full Backer", abbv: "FB")
Position.create(name: "Offensive Guard", abbv: "OG")
Position.create(name: "Defensive Back", abbv: "DB")
Position.create(name: "Defensive End", abbv: "DE")
Position.create(name: "Defensive Tackle", abbv: "DT")
Position.create(name: "Outside Linebacker", abbv: "OL")
Position.create(name: "Corner Back", abbv: "CB")
Position.create(name: "Nose Tackle", abbv: "NT")
Position.create(name: "Long Snapper", abbv: "LS")
Position.create(name: "Guard", abbv: "G")

binding.pry
0