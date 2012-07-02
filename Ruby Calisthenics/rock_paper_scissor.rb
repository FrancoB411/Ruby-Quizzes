class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def winning_strategies
  [ "RS", "SP", "PR" ]
end

def acceptable_strategies
  [ "R", "P", "S"]
end


def rps_game_winner(game) 
# game =  [ [ "Armando", "P" ], [ "Dave", "S" ] ]
  this_game = game
  raise WrongNumberOfPlayersError if game.length != 2 
    player_1 = game[0][0]
    player_2 = game[1][0]
    player_1_strategy = game[0][1].upcase
    player_2_strategy = game[1][1].upcase
    combo = "#{player_1_strategy}#{player_2_strategy}"
  
  raise NoSuchStrategyError unless acceptable_strategies.include?(player_1_strategy) && acceptable_strategies.include?(player_2_strategy)
  
  if player_1_strategy == player_2_strategy
    this_game[0]
  elsif winning_strategies.include?(combo) #player 1 wins
    this_game[0]
  else #player 2 wins
    this_game[1]
  end 
  
end

def build_game (arry)
  [ [arry[0], arry[1]], [arry[2], arry[3]] ]
end

def rps_tournament_winner(array)
  tournament = array.flatten
  tournament_winners = []
  
  while tournament.any?
    game = build_game(tournament.shift(4))
    rps_game_winner(game)
    tournament_winners << rps_game_winner(game)
  end
  
  if tournament_winners.length > 1
    tournament = tournament_winners.flatten
    rps_tournament_winner(tournament)
  else
    tournament_winners[0]
  end
end 
