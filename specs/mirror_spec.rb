require "./spec_helper.rb"

describe Mirror do
  before :each do
     @mirror = Mirror.new(1,2,"/")
  end

  describe "#new" do
    it "returns a new mirror object" do
      expect(@mirror).to be_an_instance_of(Mirror)
    end

    it "throws an ArgumentError when given fewer than 3 parameters" do
      expect(lambda {Mirror.new(0)}).to raise_error(ArgumentError)
    end
  end

  describe "#x_coordinate" do
    it "returns the correct x_coordinate" do
      expect(@mirror.x_coordinate).to eql(1)
    end
  end

  describe "#y_coordinate" do
    it "returns the correct y_coordinate" do
      expect(@mirror.y_coordinate).to eql(2)
    end
  end

  describe "#mirror_type" do
    it "returns the mirror type passed in the argument" do
      expect(@mirror.mirror_type).to be_eql("/")
    end
  end

  describe "#mirror" do
    it "returns a default value of true" do
      expect(@mirror.mirror).to be true
    end
  end
end