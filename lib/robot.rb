class Robot
  attr_accessor :x, :y, :f
  DIRECTION = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  # SIZE = 5

  def place(x,y,f)
    @x = x
    @y = y
    @f = f
  end

  def report
    "Output: #{@x},#{@y},#{@f}"
  end

  def left
    current_index = DIRECTION.index(@f)
    @f = DIRECTION[current_index - 1]
  end

  def right
    current_index = DIRECTION.index(@f)
    @f = DIRECTION[(current_index + 1)%4]
  end

end
