require_relative '../tournament'

class MeijinAClass < Tournament
  def initialize meijin, a_class_players
    @meijin = meijin
    @a_class_players = a_class_players
    @results = {}
  end

  def perform_tournament
    @results[:league_winners] = []
    junni_league = league @a_class_players.size

    junni_league.each do |card|
      winner = battle(@a_class_players[card[0]], @a_class_players[card[1]])
      @results[:league_winners] << winner[:name]
    end

    winners_order = @results[:league_winners].group_by(&:itself).map{ |key, value| [key, value.count] }.sort_by { |_, v| -v }.to_h
    p winners_order.first
  end

  def league number
    combination = []

    number.times.each do |i|
      (number - i - 1).times.each do |j|
        combination << [i, i + j + 1]
      end
    end

    combination
  end
end
