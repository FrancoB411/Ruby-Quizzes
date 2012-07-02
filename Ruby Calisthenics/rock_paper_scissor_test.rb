require 'test/unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rock_paper_scissor'


class RockPaperScissorTest < Test::Unit::TestCase

  def test_rock_beats_scissors_scissors_beats_paper_paper_beats_rock
     game = [ [ "Armando", "P" ], [ "Dave", "S" ] ]
     game1 = [ [ "Armando", "S" ], [ "Dave", "R" ] ]
     game2 = [ [ "Armando", "P" ], [ "Dave", "R" ] ]
     
     assert_equal rps_game_winner(game), [ "Dave", "S" ]
     assert_equal rps_game_winner(game1), [ "Dave", "R" ]
     assert_equal rps_game_winner(game2), [ "Armando", "P" ]
  end

  def test_return_name_and_strategy_of_winning_player
    game = [ [ "Armando", "P" ], [ "Dave", "S" ] ]
    results = rps_game_winner(game)
    assert_equal(results, [ "Dave", "S" ])

  end
  
  def test_if_same_strategy_first_player_wins
    game = [ [ "Armando", "P" ], [ "Dave", "P" ] ]
    results = rps_game_winner(game) #"Both played P, but Armando wins since they went first."
    assert results.include?("Armando")
    assert results.include?("P")
  end

  def test_number_of_players_not_2_raises_error
    assert_raise WrongNumberOfPlayersError do
      game0 = ['']
      rps_game_winner(game0)
    end
    
    assert_raise WrongNumberOfPlayersError do
      game1 = [ [ "Armando", "P" ], [ "Dave", "P" ], [ "Harry", "R" ] ]
      rps_game_winner(game1)
    end
    
    assert_raise WrongNumberOfPlayersError do
      game3 = [ [ "Armando", "P" ], [ "Dave", "P" ], [ "Harry", "R" ] ]
      rps_game_winner(game3)
    end
  end
  
  def test_strategies_case_insensitive
    game = [ [ "Armando", "P" ], [ "Dave", "s" ] ]  #"Dave wins since S > P"
    assert_equal rps_game_winner(game), [ "Dave", "s" ]
  end
  
  def test_strategies_limited_to_r_p_s_ 
    assert_raise NoSuchStrategyError do
      game = [ [ "Armando", "q" ], [ "Dave", "s" ] ]
      rps_game_winner(game) 
    end
  end
  
  def test_rps_tournament_returns_proper_scores
    arry = [
      [

        [ ["Armando", "P"], ["Dave", "S"] ], #dave, s
        [ ["Richard", "R"], ["Michael", "S"] ], #richard, r

      ], #richard, r
      [

        [ ["Allen", "S"], ["Omer", "P"] ], #Allen, s
        [ ["David E.", "R"], ["Richard X.", "P"] ] #Richard, p

      ] #Allen, s

    ]
    assert_equal rps_tournament_winner(arry), ["Richard", "R"]
  end

  def test_tournaments_can_be_nested_arbitrarily_deep
    arry = [
       [

         [ ["Armando", "P"], ["Dave", "S"] ], #dave, s
         [ ["Richard", "P"], ["Michael", "S"] ], #richard, r

       ], #richard, r
       [

         [ ["Allen", "S"], ["Omer", "P"] ], #Allen, s
         [ ["David E.", "R"], ["Richard X.", "P"] ] #Richard, p

       ], #Allen, s
       [

         [ ["Armando", "P"], ["Dave", "S"] ], #dave, s
         [ ["Richard", "P"], ["Michael", "S"] ], #richard, r

       ], #richard, r
       [

         [ ["Allen", "S"], ["Omer", "P"] ], #Allen, s
         [ ["David E.", "R"], ["Richard X.", "P"] ] #Richard, p

       ] #Allen, s

     ]
     assert_equal rps_tournament_winner(arry), ["Dave", "S"]
   end
   
   def test_build_game_method_returns_nested_arrays_with_strategies
     array = [ ["Allen", "S"], ["Omer", "P"] ].flatten
     result = build_game(array)
     
     assert_equal result.class, Array
     assert_equal result[0], ["Allen", "S"]
     assert_equal result[1], ["Omer", "P"] 
     assert_equal result[0][0], "Allen"
     assert_equal result[1][1], "P"
   end

end




