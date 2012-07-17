require './lib/poker_engine.rb'

describe PokerEngine do
  describe "score" do
    before(:each) do
      @hand1 = stub("hand1")
      @hand2 = stub("hand2")
      
      @comparison = stub("compareResult")
      @handComparer = stub("@handComparer")
      @pokerEngine = PokerEngine.new @handComparer      
      
      @comparison.stub(:winner) {"fred"}
      @comparison.stub(:reason) {"the reason"}
    end
    
    it "should invoke hand comparer" do
      @handComparer.should_receive(:compare).with(@hand1, @hand2).and_return(@comparison)

      @pokerEngine.score(@hand1, @hand2)
    end
    
    it "should return concatenation of winner and reason from hand comparer" do
      @handComparer.stub(:compare).and_return(@comparison)
      
      result = @pokerEngine.score(@hand1, @hand2)      
      result.should eq("fred wins. - with the reason")
    end
  end
end