require_relative "./spec_helper.rb"

describe MazeRunner do
  describe "#opposite_direction?" do
    context "testing for North and opposite " do
      it "returns true" do
        @laser = Laser.new(3, 5, "N")
        @mirror = MirrorFactory.get_mirror(3, 2, "/")
        @maze = MazeRunner.opposite_direction?(@laser, @mirror)
        expect(@maze).to eql(true)
      end
    end

    context "testing for North and not opposite" do
      it "returns false" do
        @laser = Laser.new(3, 5, "N")
        @mirror = MirrorFactory.get_mirror(3, 9, "/")
        @maze = MazeRunner.opposite_direction?(@laser, @mirror)
        expect(@maze).to eql(false)
      end
    end

    context "testing for West and opposite" do
      it "return true" do
        @laser = Laser.new(3, 5, "W")
        @mirror = MirrorFactory.get_mirror(7, 5, "/")
        @maze = MazeRunner.opposite_direction?(@laser, @mirror)
        expect(@maze).to eql(true)
      end
    end
  end

  describe "#along_path?" do
    context "testing N and on path" do
      it "returns false" do
        @laser = Laser.new(3, 5, "N")
        @mirror = MirrorFactory.get_mirror(3, 2, "/")
        @maze = MazeRunner.along_path?(@laser, @mirror)
        expect(@maze).to eql(true)
      end
    end

    context "testing N and off path" do
      it "returns false" do
        @laser = Laser.new(3, 5, "N")
        @mirror = MirrorFactory.get_mirror(1, 2, "/")
        @maze = MazeRunner.along_path?(@laser, @mirror)
        expect(@maze).to eql(false)
      end
    end

    context "testing W and on path" do
      it "returns false" do
        @laser = Laser.new(3, 5, "W")
        @mirror = MirrorFactory.get_mirror(1, 5, "/")
        @maze = MazeRunner.along_path?(@laser, @mirror)
        expect(@maze).to eql(true)
      end
    end

    context "testing W and off path" do
      it "returns false" do
        @laser = Laser.new(3, 5, "W")
        @mirror = MirrorFactory.get_mirror(1, 7, "/")
        @maze = MazeRunner.along_path?(@laser, @mirror)
        expect(@maze).to eql(false)
      end
    end
  end

  describe "#compare_distance" do
    context "stored_mirror is closer then mirror" do
      it "returns stored_mirror" do
        @laser = Laser.new(3, 5, "N")
        @mirror = MirrorFactory.get_mirror(3, 8, "/")
        @stored_mirror = MirrorFactory.get_mirror(3, 7, "/")
        @maze = MazeRunner.compare_distance(@mirror, @stored_mirror, @laser)

        expect(@maze).to eql(@stored_mirror)
      end
    end
  end
end