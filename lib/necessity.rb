require 'byebug'

class Necessity

  attr_reader :food, :fun, :hygiene

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
    return @hygiene *= 2 if level_max_two_item?(@food, @fun) && @hygiene < 3 && @hygiene > 0
    return @hygiene += 1 if (@food != 4 || @fun != 4) && @hygiene < 4
    return @hygiene += 1 if level_max_two_item?(@food, @fun) && (@hygiene == 3 || @hygiene.zero?)
  end

  def time_fun
    return @fun *= 2 if level_max_two_item?(@hygiene, @food) && @fun < 3 && @fun > 0
    return @fun += 1 if (@hygiene != 4 || @food != 4) && @fun < 4
    return @fun += 1 if level_max_two_item?(@hygiene, @food) && (@fun == 3 || @fun.zero?)
  end

  def time_food
    return @food *= 2 if level_max_two_item?(@hygiene, @fun) && @food < 3 && @food > 0
    return @food += 1 if (@hygiene != 4 || @fun != 4) && @food < 4
    return @food += 1 if level_max_two_item?(@hygiene, @fun) && (@food == 3 || @food.zero?)
  end

  def level_max_two_item?(item1, item2)
    return true if item1 == 4 || item2 == 4
    false
  end

  def level_max
    return true if @food == 4 && @fun == 4 && @hygiene == 4

    false
  end

  def check_level
    return true if @food == 4 || @fun == 4 || @hygiene == 4

    false
  end

  def double_hygiene
    if check_level
      @hygiene += 2
    else
      @hygiene += 1
    end
  end
end
