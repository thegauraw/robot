require_relative 'lib/robot'

if __FILE__ == $0
  robot = Robot.new
  print "Enter file name with commands: "
  filename = gets.chomp

  puts robot.read_commands(filename)
  puts robot.report
end
