class Mirror
  attr_accessor :x_coordinate, :y_coordinate, :mirror
  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @mirror = true
  end

  def get_redirect(input_direction)
    raise NotImplementedError, 'You must implement the get_redirect method'
  end
end

class ForwardMirror < Mirror
  def get_redirect(input_direction)
    if input_direction == "N"
      return "E"
    elsif input_direction == "S"
      return "W"
    elsif input_direction == "E"
      return "N"
    elsif input_direction == "W"
      return "S"
    end
  end
end

class BackwardMirror < Mirror
  def get_redirect(input_direction)
    if input_direction == "N"
      return "W"
    elsif input_direction == "S"
      return "E"
    elsif input_direction == "E"
      return "N"
    elsif input_direction == "W"
      return "S"
    end
  end
end

class MirrorFactory
  def self.get_mirror(x_coordinate, y_coordinate, type)
    if type == "/"
      return ForwardMirror.new(x_coordinate, y_coordinate)
    else
      return BackwardMirror.new(x_coordinate, y_coordinate)
    end
  end
end