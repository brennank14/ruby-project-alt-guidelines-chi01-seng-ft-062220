require "nokogiri"
require "httparty"

class PlayerScrape
    attr_reader :url
    attr_accessor :roster
    @@url = "https://www.steelers.com/team/players-roster/"
    @@roster = []

    def self.roster
        @@roster = self.scrape
    end

    def self.scrape
        unparsed_page = HTTParty.get(@@url)
        parsed_page = Nokogiri::HTML(unparsed_page.body)
        html_table = parsed_page.css('tbody tr').map {|row| row.text.strip}
        html_table = html_table.flatten
        self.player_hash(html_table)
    end

    def self.player_hash(array)
        parsed_table = array.map {|row| row.split("\n")}
        final_roster = parsed_table.map do |row|
            row = row.map {|cell| cell.strip}
            row = row.reject{|cell| cell.empty?}
            player = {
                name: row[0],
                number: row[1],
                position: row[2],
                age: row[5]
            }
        end
    end
end