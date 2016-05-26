class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    p1_value = player1[1].downcase
    p2_value = player2[1].downcase
    appr_values = ['s', 'p', 'r']

    if !(appr_values.include?(p1_value) && appr_values.include?(p2_value))
      raise NoSuchStrategyError, "Strategy must be one of R,P,S"
    end
    case p1_value
      when 'r'
        if p2_value.eql?("s")
          player1
        elsif p2_value.eql?("p")
          player2
        else player1
        end
      when "s"
        if p2_value.eql?("p")
          player1
        elsif p2_value.eql?("r")
          player2
        else player1
        end
      when "p"
        if p2_value.eql?("r")
          player1
        elsif p2_value.eql?("s")
          player2
        else player1
        end
      else
        raise NoSuchStrategyError
        #puts "FUCK IT"
    end
  end

  def self.is_player? (arr)
    arr[0].instance_of? String
  end

  def self.is_pair? (arr)
    is_player? arr[0]
  end

  def self.tournament_winner(tournament)
    if is_pair? tournament
      puts "FUCK"
      return winner(tournament[0], tournament[1])
    else
      winner(tournament_winner(tournament[0]), tournament_winner(tournament[1]))
    end
  end

end

#RockPaperScissors.winner(["Armando", "w"], ["Dave", "S"])