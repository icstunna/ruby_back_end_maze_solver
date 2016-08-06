require_relative './spec_helper.rb'

describe BoardEnvironment do
  before :all do
    @mirrors = [ ["9 9 \\"],
                ["0 9 /"],
                ["3 3 \\"]
                ]
    @dimension = ["10 15"]
  end

  before :each do
    @board = BoardEnvironment.new(@dimension, @mirrors)
  end

  describe "#new" do
    context "A new instance of Class BoardEnvironment is instantiated with proper arguments" do
      it "returns a new instance of the BoardEnvironment class" do
        expect(@board).to be_an_instance_of(BoardEnvironment)
      end
    end

    context "A new instance of Class BoardEnvironment is instantiated with 0 arguements" do
      it "returns an ArgumentError when given fewer then 1 parameter" do
        expect(lambda {BoardEnvironment.new}).to raise_error(ArgumentError)
      end
    end
  end

  describe "#width" do
    it "returns the value of 10" do
      expect(@board.width).to eql(10)
    end
  end

  describe "#height" do
    it "returns the value of 15" do
      expect(@board.height).to eql(15)
    end
  end

  describe "#mirrors" do
    it "returns an array" do
      expect(@board.mirrors).to be_an_instance_of(Array)
    end
  end

  describe "#board" do
    it "returns an array" do
      expect(@board.board).to be_an_instance_of(Array)
    end
  end

  describe "#create_environment" do
    it "returns a an array of Mirror objects with mirror attributes" do
      @board.create_environment
      expect(@board.board.first.mirror).to be true
    end
  end

end