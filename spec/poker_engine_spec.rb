require './lib/poker_engine.rb'

describe PokerEngine do
  let(:hand_1) { double("hand_1") }
  let(:hand_2) { double("hand_2") }
  
  let(:comparison) { double("comparison result", winner: "fred", reason: "the reason") }
  let(:hand_comparer) { double("HandComparer", compare: comparison) }

  subject(:poker_engine) { PokerEngine.new(hand_comparer) }

  describe "score" do
    it "should invoke hand comparer" do
      hand_comparer.should_receive(:compare).with(hand_1, hand_2).and_return(comparison)
      poker_engine.score(hand_1, hand_2)
    end
    
    it "should return concatenation of winner and reason from hand comparer" do
      poker_engine.score(hand_1, hand_2).should be == "fred wins. - with the reason"
    end
  end
end