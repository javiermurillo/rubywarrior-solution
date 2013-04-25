require_relative '../player.rb'

describe Player do

  before :each do
    @player = Player.new
  end

  it "should respond to play_turn" do
    @player.respond_to?("play_turn").should be_true
  end
end
