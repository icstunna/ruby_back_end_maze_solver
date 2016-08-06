require_relative "./spec_helper.rb"

describe ReaderWriter do
  before :all do
    @input_string = "../db/test_input.csv"
    @output_string = "../db/test_output.csv"
  end

  before :each do
    @new_file = ReaderWriter.new(@input_string)
  end

  describe "#new" do
    it "returns an instance of ReaderWriter" do
      expect(@new_file).to be_an_instance_of(ReaderWriter)
    end

    it "returns an instance of ReaderWriter" do
      expect(lambda{ReaderWriter.new}).to raise_error(ArgumentError)
    end
  end

  describe "#dimensions" do
    it "returns an Array" do
      expect(@new_file.dimensions).to be_an_instance_of(Array)
    end
  end

  describe "#dimensions#first" do
    it "returns a String" do
      expect(@new_file.dimensions.first).to be_an_instance_of(String)
    end
  end

  describe "#laser_parameters" do
    it "returns an Array" do
      expect(@new_file.laser_parameters).to be_an_instance_of(Array)
    end
  end

  describe "#laser_parameters#first" do
    it "returns a String" do
      expect(@new_file.laser_parameters.first).to be_an_instance_of(String)
    end
  end

  describe "#mirror_parameters  " do
    it "returns an Array" do
      expect(@new_file.mirror_parameters).to be_an_instance_of(Array)
    end
  end

  describe "#mirror_parameters#first#first" do
    it "returns a String" do
      expect(@new_file.mirror_parameters.first.first ).to be_an_instance_of(String)
    end
  end

  describe "#writer" do
    it "writes the results to your output CSV file" do
      new_game = GameController.new(@new_file.dimensions,
                                    @new_file.laser_parameters,
                                    @new_file.mirror_parameters)
      @new_file.writer(new_game.play, @output_string)
      read_output = ReaderWriter.new(@output_string)
      expect(read_output.dimensions.first.to_i).to eql(258)
    end
  end
end