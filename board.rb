class BoardEnvironment
  attr_accessor :width, :height, :board, :mirrors

  def initialize(dimensions, mirrors_array = [])
    @width = dimensions.first.split(" ")[0].to_i
    @height = dimensions.first.split(" ")[1].to_i
    @mirrors_rep = mirrors_array
    @mirrors = []
    @board = []
  end

  def create_environment
    @mirrors.each do |mirror|
      x_coordinate = mirror.first.split(" ")[0].to_i
      y_coordinate = mirror.first.split(" ")[1].to_i
      mirror_type = mirror.first.split(" ")[2]
      @mirrors << MirrorFactory.get_mirror(x_coordinate, y_coordinate, mirror_type)
      @board << MirrorFactory.get_mirror(x_coordinate, y_coordinate, mirror_type) #Factory method that creates mirror objects
    end
    return @board
  end
end