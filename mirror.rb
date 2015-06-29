class Mirror
  attr_accessor :x_coordinate, :y_coordinate, :mirror_type, :mirror
  def initialize(x_coordinate, y_coordinate, mirror_type)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @mirror_type = mirror_type
    @mirror = true
  end
end