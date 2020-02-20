player = [
  {name: '羽生善治', title: '九段', rate: 1800 },
  {name: '渡辺明', title: '三冠', rate: 1900 }
]

def battle(player1, player2)
  finger = rand
  watershed = 0.5

  if finger >= watershed
    player1
  else
    player2
  end
end

10.times {
  p battle(player[0], player[1])
}
