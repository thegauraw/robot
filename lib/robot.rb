class Robot
  attr_accessor :x, :y, :f
  DIRECTION = ['NORTH', 'EAST', 'SOUTH', 'WEST']
  TABLE_SIZE = 5

  def place(x,y,f)
    @x = x.to_i
    @y = y.to_i
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

  def move
    if @f == 'NORTH'
      @y += 1 if @y < TABLE_SIZE-1
    elsif @f == 'SOUTH'
      @y -= 1 if @y > 0
    elsif @f == 'EAST'
      @x += 1 if @x < TABLE_SIZE-1
    elsif @f == 'WEST'
      @x -= 1 if @x > 0
    end
  end

  def follow(command)
    action, params = command.chomp.split(' ')
    if params
      x,y,f = params.split(',')
      place(x, y, f)
    else
      if action.upcase == 'MOVE'
        move
      elsif action.upcase == 'REPORT'
        report
      elsif action.upcase == 'LEFT'
        left
      elsif action.upcase == 'RIGHT'
        right
      end
    end
  end

end
