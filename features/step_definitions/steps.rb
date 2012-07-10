require './lib/hand.rb'
require './lib/poker_engine.rb'

Given /^Fred has "(.*?)"$/ do |hand|
  @fredsHand = Hand.new("Fred", hand.split(' '))
end


Given /^James has "(.*?)"$/ do |hand|
  @jamesHand = Hand.new("James", hand.split(' '))
end

When /^they show hands$/ do
  pokerEngine = PokerEngine.new
  @gameResult = pokerEngine.score(@fredsHand, @jamesHand)  
end

Then /^the result will be "(.*?)"$/ do |expected_result|
  @gameResult.should eq(expected_result)
end