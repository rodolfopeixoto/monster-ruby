require 'byebug'

class Necessity
  def initialize
    @food = 0
    @fun = 0
    @hygiene = 0
  end

  def eat
    @food = 0
  end

  def sanitize
    @hygiene = 0
  end

  def amuse
    @fun = 0
  end

  def time_hygiene
   @hygiene += 1 if @hygiene == 0 && (level_fun == 4 || level_food == 4)
   return @hygiene *= 2 if (level_fun == 4 || level_food == 4) && @hygiene <= 2
   return @hygiene += 1 if @hygiene < 4
  end

  def time_fun
    return @fun *= 2 if (level_hygiene == 4 || level_food == 4) && @fun <= 2
    return @fun += 1 if @fun == 3 && (level_hygiene == 4 || level_food == 4)
    return @fun += 1 if @fun < 4
  end

  def time_food
    return @food *= 2 if (level_hygiene == 4 || level_fun == 4) && @food <= 2
    return @food += 1 if @food == 3 && (level_hygiene == 4 || level_fun == 4)
    return @food += 1 if @food < 4
  end

  def level_food
    @food
  end

  def level_fun
    @fun
  end

  def level_hygiene
    @hygiene
  end

  def level_max
    return true if level_food == 4 && level_fun == 4 && level_hygiene == 4
    return false
  end

  def check_level
    return true if level_food == 4 || level_fun == 4 || level_hygiene == 4
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
