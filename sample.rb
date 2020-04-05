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

10.times {
  p battle(players[0], players[1])
}
