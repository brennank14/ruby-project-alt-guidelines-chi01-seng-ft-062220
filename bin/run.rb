require_relative '../config/environment'

puts PlayerScrape.roster {|player| player.position}