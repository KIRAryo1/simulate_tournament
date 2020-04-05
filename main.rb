require_relative 'tournament'
require_relative 'players'

class Main
  def self.perform
    players = Players.all_players
    winners = []

    10000.times do
      tournament = Tournament.new(players)
      tournament.perform_tournament
      # puts "優勝者: #{tournament.results[:winner_3rd][:name]}"

      winners << tournament.results[:winner_3rd][:name]
    end

    p winners.group_by(&:itself).map{ |key, value| [key, value.count] }.sort_by { |_, v| -v }.to_h
  end
end

Main.perform
