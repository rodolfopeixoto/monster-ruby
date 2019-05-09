require 'byebug'

class Necessity

  attr_accessor :food, :fun, :hygiene

  def initialize
    @food = 0
    @fun = 0
    @hygiene = 0
  end

  def eat
    @food = 0
    @hygiene += 1 if @hygiene < 4
  end

  def sanitize
    @hygiene = 0
  end

  def amuse
    @fun = 0
    @hygiene += 1 if @hygiene < 4
  end

  def time_hygiene
  end

  def time_fun
    @fun += 1
  end

  def time_food
  end

  def level_max
    return true if @food == 4 && @fun == 4 && @hygiene == 4
    return false
  end

  def check_level
    return true if @food == 4 || @fun == 4 || @hygiene == 4
    return false
  end

  def double_hygiene
    if check_level
      @hygiene += 2
    else
      @hygiene += 1
    end
  end
end
