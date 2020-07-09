require_relative '../config/environment'
require 'pry'

Coach.destroy_all
Position.destroy_all
Player.destroy_all

Coach.create(name: "Mike Tomlin")
Coach.create(name: "John Mitchell")
Coach.create(name: "Randy Fitchner")
Coach.create(name: "Matt Canada")
Coach.create(name: "James Daniel")
Coach.create(name: "Eddie Faulkner")
Coach.create(name: "Ike Hilliard")
Coach.create(name: "Shaun Sarret")
Coach.create(name: "Adrian Klemm")
Coach.create(name: "Keith Butler")
Coach.create(name: "Teryl Austin")
Coach.create(name: "Tom Bradley")
Coach.create(name: "Karl Dunbar")
Coach.create(name: "Jerry Olsavsky")
Coach.create(name: "Danny Smith")

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
Position.create(name: "Defensive Back", abbv: "DB")
Position.create(name: "Defensive End", abbv: "DE")
Position.create(name: "Defensive Tackle", abbv: "DT")
Position.create(name: "Outside Linebacker", abbv: "OL")
Position.create(name: "Corner Back", abbv: "CB")
Position.create(name: "Nose Tackle", abbv: "NT")
Position.create(name: "Long Snapper", abbv: "LS")
Position.create(name: "Guard", abbv: "G")


def create_players
    PlayerScrape.roster.each do  |playerData|
        new_player = Player.create(name: playerData[:name], number: playerData[:number], age: playerData[:age])
        dataAbbv = playerData[:position].include?("/") ? playerData[:position].split('/')[0] : playerData[:position]
        new_player.position = Position.where(abbv: dataAbbv).first
        new_player.coach = Coach.find_by(name: coach_assignment(dataAbbv))
        new_player.save
    end
end


def coach_assignment(abbv_position)
    case abbv_position
        when "C"
            "Shaun Sarret"
        when "OG"
            "Adrian Klemm"
        when "OT"
            "Shaun Sarret"
        when "QB"
            "Matt Canada"
        when "RB"
            "Eddie Faulkner"
        when "WR"
            "Ike Hilliard"
        when "TE"
            "James Daniel"
        when "S"
            "Tom Bradley"
        when "K"
            "Danny Smith"
        when "P"
            "Danny Smith"
        when "LB"
            "Jerry Olsavsky"
        when "FB"
            "Adrian Klemm"
        when "OG"
            "Shaun Sarret"
        when "DB"
            "Tom Bradley"
        when "DE"
            "Karl Dunbar"
        when "DT"
            "Karl Dunbar"
        when "OL"
            "Adrian Klemm"
        when "CB"
            "Tom Bradley"
        when "NT"
            "Tom Bradley"
        when "LS"
            "Danny Smith"
        when "G"
            "Shaun Sarret"
        else
            "Mike Tomlin"
    end
end

create_players()
