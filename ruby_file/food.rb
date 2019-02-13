require 'gosu'

class Fruit
  attr_accessor :x, :y
  def initialize
    @x = rand(60..32 * Snake::SIZE - 20).round(-1)
    @y = rand(50..24 * Snake::SIZE - 20).round(-1)
  end

  def update
    # @x = (rand * 24)
    # @y += @delta_y
  end

  def draw
    # .draw_rect(x, y, width, height, c, z = 0, mode = :default)  void
    Gosu.draw_rect(
      @x,
      @y,
      Snake::SIZE,
      Snake::SIZE,
      Gosu::Color::RED
    )
  end

  def regenerate
    @x = rand(20..60 * Snake::SIZE - 20).round(-1)
    @y = rand(20..50 * Snake::SIZE - 20).round(-1)
  end
end
