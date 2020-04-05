players = [
  {name: '羽生善治', title: '九段', rate: 1836 },
  {name: '渡辺明', title: '三冠', rate: 1933 },
  {name: '藤井聡太', title: '七段', rate: 1938 },
  {name: '豊島将之', title: '竜王名人', rate: 1916},
  {name: '永瀬拓矢', title: '二冠', rate: 1924},
  {name: '菅井竜也', title: '八段', rate: 1839},
  {name: '千田翔太', title: '七段', rate: 1825},
  {name: '斎藤慎太郎', title: '八段', rate: 1803},
]

def battle(player1, player2)
  finger = rand
  watershed = 1 / ( 10.0 ** ( (player1[:rate] - player2[:rate]) / 400.0 ) + 1 )

  if finger >= watershed
    player1
  else
    player2
  end
end

class Tournament
  attr_reader :results

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

winners = []

10000.times do
  tournament = Tournament.new(players)
  tournament.perform_tournament
  # puts "優勝者: #{tournament.results[:winner_3rd][:name]}"

  winners << tournament.results[:winner_3rd][:name]
end

p winners.group_by(&:itself).map{ |key, value| [key, value.count] }.to_h
