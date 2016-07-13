require "./spec_helper.rb"

describe Mirror do
  before :each do
     # @mirror = Mirror.new(1,2,"/")
     @forward_mirror = ForwardMirror.new(1,2)
     @backward_mirror = BackwardMirror.new(1,2)
  end

  describe "#new" do
    it "returns a new forward mirror object" do
      expect(@forward_mirror).to be_an_instance_of(ForwardMirror)
      expect(@backward_mirror).to be_an_instance_of(BackwardMirror)

    end
  end

  describe "#x_coordinate" do
    it "returns the correct x_coordinate" do
      expect(@forward_mirror.x_coordinate).to eql(1)
      expect(@backward_mirror.x_coordinate).to eql(1)
    end
  end

  describe "#y_coordinate" do
    it "returns the correct y_coordinate" do
      expect(@forward_mirror.y_coordinate).to eql(2)
      expect(@backward_mirror.y_coordinate).to eql(2)
    end
  end

  describe "#mirror" do
    it "returns a default value of true" do
      expect(@forward_mirror.mirror).to be true
      expect(@backward_mirror.mirror).to be true
    end
  end

  describe "#get_redirect" do
    it "returns the correct redirect" do
      expect(@forward_mirror.get_redirect("N")).to eql("E")
      expect(@forward_mirror.get_redirect("S")).to eql("W")
      expect(@forward_mirror.get_redirect("E")).to eql("N")
      expect(@forward_mirror.get_redirect("W")).to eql("S")

      expect(@backward_mirror.get_redirect("N")).to eql("W")
      expect(@backward_mirror.get_redirect("S")).to eql("E")
      expect(@backward_mirror.get_redirect("E")).to eql("S")
      expect(@backward_mirror.get_redirect("W")).to eql("N")
    end
  end
end