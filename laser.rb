class Laser
  attr_accessor :x_position, :y_position, :direction, :area_traversed, :stop, :looping, :mirror_cells_touch, :mirror_cells_touch_limit
  def initialize(laser_info_array)
    @x_position = laser_info_array.first.split(" ")[0].to_i
    @y_position = laser_info_array.first.split(" ")[1].to_i
    @direction = laser_info_array.first.split(" ")[2].upcase
    @area_traversed = 0
    @stop = false
    @looping = false
    @mirror_cells_touch = Hash.new(0)
    @mirror_cells_touch_limit = 0
  end

  def move
    if self.direction == "N"
      self.area_traversed += 1
      self.y_position += 1
      return self
    elsif self.direction == "S"
      self.area_traversed += 1
      self.y_position -= 1
      return self
    elsif self.direction == "E"
      self.area_traversed += 1
      self.x_position += 1
      return self
    elsif self.direction == "W"
      self.area_traversed += 1
      self.x_position -= 1
      return self
    end
  end

  def mirror_contact?(cell)
    if self.x_position == cell.x_coordinate && self.y_position == cell.y_coordinate
      return true
    else
      return false
    end
  end

  def mirror_contact_tally(cell)
    @mirror_cells_touch["#{cell.x_coordinate} #{cell.y_coordinate}"] += 1
    @mirror_cells_touch.each_value do |value|
      if value >= 50
        @mirror_cells_touch_limit += 1
      end
    end
  end

  def change_direction(mirror)
    self.direction = mirror.get_redirect(self.direction)
  end

  def stop?(environtment)
    max_height_coordinate = environtment.height - 1
    max_width_coordinate = environtment.width - 1
    if self.direction == "N" && self.y_position == max_height_coordinate
      self.stop = true
      return self.stop
    elsif self.direction == "S" && self.y_position == 0
      self.stop = true
      return self.stop
    elsif self.direction == "E" && self.x_position == max_width_coordinate
      self.stop = true
      return self.stop
    elsif self.direction == "W" && self.x_position == 0
      self.stop = true
      return self.stop
    end
  end

  def loop?
    if @mirror_cells_touch_limit >= 4
      self.looping = true
      self.stop = true
      return self.stop
    end
  end

  def execute_laser(environment) #This is the method that needs to be refactored from a finite state to vectored state
    until stop?(environment) || loop?
      move
      environment.board.each do |cell|
        if cell.mirror
          if mirror_contact?(cell)
            change_direction(cell)
            mirror_contact_tally(cell)
          end
        end
      end
    end
    return self
  end
end