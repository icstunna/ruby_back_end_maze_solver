class GameController
  def initialize(board_parameters, laser_location_direction, mirror_coordinates)
    @board_environment = BoardEnvironment.new(board_parameters, mirror_coordinates)
    @laser = Laser.new(laser_location_direction)
  end

  def play
    @board_environment.create_environment
    @laser.execute_laser(@board_environment)
  end
end