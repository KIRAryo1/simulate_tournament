players = [
  {name: '羽生善治', title: '九段', rate: 1800 },
  {name: '渡辺明', title: '三冠', rate: 1900 }
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

10.times {
  p battle(players[0], players[1])
}
