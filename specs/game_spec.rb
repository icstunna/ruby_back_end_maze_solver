require "./spec_helper.rb"

describe GameController do
  before :all do
    @mirrors = [ ["9 9 \\"],
                ["0 9 /"],
                ["3 3 \\"]
                ]
    @dimension = ["10 15"]
    @laser_parameters = ["10 10 S"]
  end

  before :each do
    @game = GameController.new(@dimension, @laser_parameters, @mirrors)
  end

  describe "#new" do
    it "returns a new GameController object" do
      expect(@game).to be_an_instance_of(GameController)
    end

    it "throws an ArgumentError when given fewer than 1 parameters" do
      expect(lambda {GameController.new()}).to raise_error(ArgumentError)
    end
  end

  describe "#play" do
    it "" do
    end
  end
end