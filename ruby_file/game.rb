require 'gosu'
require_relative 'food'
require_relative 'snake'

class SnakeGame < Gosu::Window
  def initialize
    super 60 * Snake::SIZE, 50 * Snake::SIZE, false, 1000 / 10
    self.caption = "Snake Game"
    @snake = Snake.new
    @fruit = Fruit.new
    @score = 0
    @font = Gosu::Font.new(20)
    @time_movement = Time.now
    @speed = 0.5
  end

  def update
    return if (Time.now - @time_movement) < @speed

    @time_movement = Time.now
    @snake.update
    close if @snake.dead?
    if @snake.x == @fruit.x && @snake.y == @fruit.y
      @score += 1
      @speed -= 0.01
      @fruit.regenerate
      @snake.increase_size
    end

    @snake.pos[0..-2].each do |x, y|
      close if x == @snake.x && y == @snake.y && @snake.tail > 3
    end
  end

  def draw
    @snake.draw
    @fruit.draw
    # #draw_text(text, x, y, z, scale_x = 1, scale_y = 1, color = 0xff_ffffff, mode = :default) ⇒ void
    @font.draw_text(@score.to_s, 10, 10, 1, 1, 1, Gosu::Color::YELLOW)
  end

  def button_down(id)
    case id
    when Gosu::KbUp then @snake.up
    when Gosu::KbDown then @snake.down
    when Gosu::KbLeft then @snake.left
    when Gosu::KbRight then @snake.right
    end
  end
end

SnakeGame.new.show
