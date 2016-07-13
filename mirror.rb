class Mirror #Mirror Super Class - Ruby polymorphism (single interface to objects of different types)
  attr_accessor :x_coordinate, :y_coordinate, :mirror
  def initialize(x_coordinate, y_coordinate)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @mirror = true
  end

  def get_redirect(input_direction) #contractual agreement for sub-classes to have this method
    raise NotImplementedError, 'You must implement the get_redirect method'
  end
end

class ForwardMirror < Mirror #Sub class of mirror - Polymorphism
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

class BackwardMirror < Mirror #Sub class or mirror - Polymorphism
  def get_redirect(input_direction)
    if input_direction == "N"
      return "W"
    elsif input_direction == "S"
      return "E"
    elsif input_direction == "E"
      return "S"
    elsif input_direction == "W"
      return "N"
    end
  end
end

class MirrorFactory #Factory Design Pattern
  def self.get_mirror(x_coordinate, y_coordinate, type)
    if type == "/"
      return ForwardMirror.new(x_coordinate, y_coordinate)
    else
      return BackwardMirror.new(x_coordinate, y_coordinate)
    end
  end
end