require './lib/hand_comparer.rb'

describe @handComparer do
  describe "scoring two hands" do
    context "with a High win" do
      before(:each) do
        @playerName = "asdfjalskdf"
        @losingHand = stub("@losingHand")
        @losingHand.stub(:score) {9}
        @winningHand = stub("@winningHand")
        @winningHand.stub(:score) {10}
        @winningHand.stub(:playerName) {@playerName}
        @handComparer = HandComparer.new

      end
      
      it "should specify player 1 if hand one is higher" do
        comparison = @handComparer.compare(@losingHand, @winningHand)
        comparison.winner.should eq(@playerName)
      end

      it "should specify player 2 if hand two is higher" do
        comparison = @handComparer.compare(@winningHand, @losingHand)
        comparison.winner.should eq(@playerName)
      end
      
      it "should specify tie if both decks score the same" do
        comparison = @handComparer.compare(@winningHand, @winningHand)
        comparison.winner.should eq("tie")
      end


      
    end
  end
end
