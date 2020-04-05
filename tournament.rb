class Tournament
  attr_reader :results

  def battle(player1, player2)
    finger = rand
    watershed = 1 / ( 10.0 ** ( (player1[:rate] - player2[:rate]) / 400.0 ) + 1 )

    if finger >= watershed
      player1
    else
      player2
    end
  end

  def initialize players
    @players = players.shuffle
    @results = {}
  end

  def perform_tournament
    winners_1st = [
      battle(@players[0], @players[1]),
      battle(@players[2], @players[3]),
      battle(@players[4], @players[5]),
      battle(@players[6], @players[7]),
    ]
    @results[:winners_1st] = winners_1st

    winners_2nd = [
      battle(winners_1st[0], winners_1st[1]),
      battle(winners_1st[2], winners_1st[3]),
    ]
    @results[:winners_2nd] = winners_2nd

    winner_3rd = battle(winners_2nd[0], winners_1st[1])
    @results[:winner_3rd] = winner_3rd
  end
end
