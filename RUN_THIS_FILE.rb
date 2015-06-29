require "CSV"
require "./board.rb"
require "./laser.rb"
require "./mirror.rb"
require "./game.rb"
require "./file_reader.rb"

puts "please enter maze followed by your input and output file"
puts "ie: maze ./path/to/input/file.csv ./path/to/output/file.csv"
puts "ie2: MAZE ./input.csv ./output.csv"
string = gets.chomp

if string.split(" ")[0].upcase == "MAZE"
  input_file = string.split(" ")[1]
  output_file = string.split(" ")[2]
  game_file = ReaderWriter.new(input_file)

  new_game = GameController.new(game_file.dimensions,
                              game_file.laser_parameters,
                              game_file.mirror_parameters)

  game_results = new_game.play

  game_file.writer(game_results, output_file)
else
  puts "you did not input the proper command, please type maze before the input or output files"
end