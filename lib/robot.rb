class Robot
  attr_accessor :x, :y, :f

  def place(x,y,f)
    @x = x
    @y = y
    @f = f
  end

  def report
    "Output: #{@x},#{@y},#{@f}"
  end

end
