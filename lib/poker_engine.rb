require './lib/hand_comparer.rb'
class PokerEngine
  def initialize (handComparer = HandComparer.new)
    @handComparer = handComparer
  end
  def score (hand1, hand2)
    comparison = @handComparer.compare(hand1, hand2)
    result = comparison.winner + " wins. - with " +  comparison.reason

  end
end