require './lib/comparison.rb'
class HandComparer
  
  def compare (hand1, hand2)
    if (hand1.score == hand2.score)
      Comparison.new "tie"  
    elsif(hand1.score > hand2.score)
      Comparison.new hand1.playerName
    else 
      Comparison.new hand2.playerName
    end
  end
end