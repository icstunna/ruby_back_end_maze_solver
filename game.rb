class GameController
  def initialize(board_parameters, laser_location_direction, mirror_coordinates)
    @board_environment = BoardEnvironment.new(board_parameters, mirror_coordinates)
    @laser = Laser.new_using_info_array(laser_location_direction)
    @maze_runner = MazeRunner.new
  end

  def play
    puts "1"
    @board_environment.create_environment
    puts "2"
#    @maze_runner = MazeRunner.new()
    puts "3"
    @maze_runner.run_the_maze(@laser,@board_environment)
  end
end