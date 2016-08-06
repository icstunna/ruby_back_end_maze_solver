class MazeRunner

  def initialize
    @touched_mirrors = []
  end

  def run_the_maze(laser, board)
    mirror = MazeRunner.find_mirror(laser, board)
    if mirror == nil
      puts "Laser: #{laser.x_position}:#{laser.y_position} -> #{laser.direction} :: WALL"
      return
    end
    if touch_prior?(mirror)
      puts "Laser: #{laser.x_position}:#{laser.y_position} -> #{laser.direction} :: INFINITE"
      return
    end
    @touched_mirrors << mirror
    laser = move(mirror, laser)
    return run_the_maze(laser, board)
  end

  def touch_prior?(mirror)
    return @touched_mirrors.include?(mirror)
  end

  def move(mirror, laser)
    #get new laser
    #append to path
    #touch the mirror
    direction = mirror.get_redirect(laser.direction)
    x = mirror.x_coordinate
    y = mirror.y_coordinate
    return Laser.new(x, y, direction)
  end

  ##############################################
  # Find Mirror Methods
  ##############################################

  def self.find_mirror(laser, board)
    stored_mirror = nil

    board.mirrors.each do |mirror|
      self.opposite_direction?(laser, mirror)
      self.along_path?(laser, mirror)
      stored_mirror = self.compare_distance(mirror, stored_mirror, laser)
    end
    return stored_mirror
  end

  def self.opposite_direction?(laser, mirror)
    if laser.direction == "N"
      if laser.y_position > mirror.y_coordinate
        return true
      end
    elsif laser.direction == "S"
      if laser.y_position < mirror.y_coordinate
        return true
      end
    elsif laser.direction == "E"
      if laser.x_position > mirror.x_coordinate
        return true
      end
    elsif laser.direction == "W"
      if laser.x_position < mirror.x_coordinate
        return true
      end
    end

    return false
  end

  def self.along_path?(laser, mirror)
    if laser.direction == "N" || laser.direction == "S"
      if laser.x_position == mirror.x_coordinate
        return true
      end
    elsif laser.direction == "E" || laser.direction == "W"
      if laser.y_position == mirror.y_coordinate
        return true
      end
    end

    return false
  end

  def self.compare_distance(mirror, stored_mirror, laser)
    if stored_mirror == nil
      return mirror
    end

    if laser.direction == "N"
      if mirror.y_coordinate < stored_mirror.y_coordinate
        return mirror
      else
        return stored_mirror
      end
    elsif laser.direction == "S"
      if mirror.y_coordinate < stored_mirror.y_coordinate
        return stored_mirror
      else
        return mirror
      end
    elsif laser.direction == "W"
      if mirror.x_coordinate < stored_mirror.x_coordinate
        return mirror
      else
        return stored_mirror
      end
    elsif laser.direction == "E"
      if mirror.x_coordinate < stored_mirror.x_coordinate
        return stored_mirror
      else
        return mirror
      end
    end
  end
end