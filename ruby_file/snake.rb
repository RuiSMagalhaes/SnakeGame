require 'gosu'

class Snake
  SIZE = 10
  MIN_TAIL = 3
  attr_accessor :x, :y
  attr_reader :pos, :tail
  def initialize
    @x = 30
    @y = 30

    @delta_x = 0
    @delta_y = 0

    @tail = MIN_TAIL

    @pos = []
  end

  def update

    @x += @delta_x
    @y += @delta_y

    @pos << [@x, @y]

    @pos.shift until @pos.size <= @tail
  end

  def draw
    # .draw_rect(x, y, width, height, c, z = 0, mode = :default)  void
    @pos.each do |x, y|
      Gosu.draw_rect(
        x,
        y,
        SIZE - 1,
        SIZE - 1,
        Gosu::Color::WHITE
      )
    end
  end

  def increase_size
    @tail += 1
  end

  def dead?
    (@x > 60 * SIZE) || @x.negative? || @y.negative? || (@y > 50 * SIZE)
  end

  def up
    @delta_x = 0
    @delta_y = -SIZE
  end

  def down
    @delta_x = 0
    @delta_y = SIZE
  end

  def right
    @delta_x = SIZE
    @delta_y = 0
  end

  def left
    @delta_x = -SIZE
    @delta_y = 0
  end
end
