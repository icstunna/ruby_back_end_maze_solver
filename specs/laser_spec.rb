require_relative "./spec_helper"

describe Laser do

  before :all do
    @dimensions = ["20 20"]
    @mirrors = [ ["9 9 \\"],
                ["0 9 /"],
                ["3 3 \\"]
                ]

    @cell_contact = ForwardMirror.new(10,10)

    @cell_no_contact = ForwardMirror.new(1,1)
  end

  before :each do
    @board = BoardEnvironment.new(@dimensions, @mirrors)
    @laser = Laser.new(["10 10 S"])
  end

  describe "#new" do
    it "returns a new instance of the Laser class" do
      expect(@laser).to be_an_instance_of(Laser)
    end

    it "throws an ArgumentError when given fewer then 1 parameter" do
      expect(lambda {Laser.new}).to raise_error(ArgumentError)
    end
  end

  describe "#x_position" do
    it "returns the position of the Laser on the x axis" do
      expect(@laser.x_position).to eql(10)
    end
  end

  describe "#y_position" do
    it "returns the position of the Laser on the y axis" do
      expect(@laser.y_position).to eql(10)
    end
  end

  describe "#direction" do
    it "returns the direction the Laser in intended to head" do
      expect(@laser.direction).to eql("S")
    end
  end

  describe "#area_traversed" do
    it "returns a default value of 0 for the area traversed" do
      expect(@laser.area_traversed).to eql(0)
    end
  end

  describe "#stop" do
    it "returns a default value of false" do
      expect(@laser.stop).to be false
    end
  end

  describe "#looping" do
    it "returns a default value of false" do
      expect(@laser.looping).to be false
    end
  end

  describe "#mirror_cells_touch" do
    it "returns an instance of a Hash object" do
      expect(@laser.mirror_cells_touch).to be_an_instance_of(Hash)
    end
  end

  describe "#mirror_cells_touch_limit" do
    it "returns a default value of 0" do
      expect(@laser.mirror_cells_touch_limit).to eql(0)
    end
  end

  describe "#move" do
    it "expects the area traversed to increase by 1" do
      @laser.move
      expect(@laser.area_traversed).to eql(1)
    end
  end

  describe "#mirror_contact" do
    context "laser coordinates are the same as that of cell" do
      it "returns a true value signifiying contact with a mirror" do
        expect(@laser.mirror_contact?(@cell_contact)).to be true
      end
    end

    context "laser coordinates are different then that of the cell" do
      it "returns a false value signifiying no contact with the mirror" do
        expect(@laser.mirror_contact?(@cell_no_contact)).to be false
      end
    end
  end

  describe "#mirror_contact_tally" do
    it "increases the number of mirror cells touched by 1" do
      @laser.mirror_contact_tally(@cell_contact)
      expect(@laser.mirror_cells_touch["#{@cell_contact.x_coordinate} #{@cell_contact.y_coordinate}"]).to eql(1)
    end
  end

  describe "#change_direction" do
    it "changes the direction of the Laser from South to West" do
      @laser.change_direction(@cell_contact)
      expect(@laser.direction).to eql("W")
    end
  end

  describe "#stop?" do
    context "The laser is at the edge of the board and in the direction of the edge of the board, it will stop" do
      it "the stop attribute is true" do
        laser = Laser.new(["9 9 N"])
        board = BoardEnvironment.new(["10 10"])
        laser.stop?(board)
        expect(laser.stop).to be true
      end
    end
    context "The laser is not near the edge of the board and is not in the direction of the edge of the board, it will not stop" do
      it "the stop attribute is false" do
        laser = Laser.new(["0 0 N"])
        board = BoardEnvironment.new(["10 10"])
        laser.stop?(board)
        expect(laser.stop).to be false
      end
    end
  end

  describe "#loop?" do
    context "The board has touched 3 mirror cells over the limit of what seems reasonable and is about 1 move away from hitting the limit of its 4th mirror determining that it is in a loop" do
      it "The laser is in a loop" do
        @laser.mirror_cells_touch_limit = 3
        @laser.mirror_cells_touch["#{@cell_contact.x_coordinate} #{@cell_contact.y_coordinate}"] = 49
        @laser.mirror_contact_tally(@cell_contact)
        @laser.loop?
        expect(@laser.looping).to be true
      end
    end

    context "The board has not touched any mirrors nor is it in the process of touching any" do
      it "The laser is not in a loop" do
        @laser.loop?
        expect(@laser.looping).to be false
      end
    end
  end

  describe "#execute_laser" do
    context "the laser is executed and traversing a board" do
      it "expect to return a Laser object with the attributes of area_traversed and stop to have changed from default" do
        @board.create_environment
        results = @laser.execute_laser(@board)
        expect(results.stop).to be true
        expect(results.area_traversed).to eql(10)
      end
    end
  end
end