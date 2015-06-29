require "CSV"

class ReaderWriter
  attr_accessor :file, :dimensions, :laser_parameters, :mirror_parameters
  def initialize(string)
    @file = CSV.read(string)
    @dimensions = @file[0]
    @laser_parameters = @file[1]
    @mirror_parameters = @file[2..-1]
  end

  def writer(laser_attributes, output_directory)
    CSV.open(output_directory, "w+") do |csv|
      if laser_attributes.looping == true
        csv << ["-1"]
      else
        csv << [laser_attributes.area_traversed]
        csv << ["#{laser_attributes.x_position} #{laser_attributes.y_position}"]
      end
    end
  end
end