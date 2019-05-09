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
    @hygiene += 1 if level_item_smaller_than_four?(@hygiene)
  end

  def sanitize
    @hygiene = 0
  end

  def amuse
    @fun = 0
    @hygiene += 1 if level_item_smaller_than_four?(@hygiene)
  end

  def time_hygiene
    return @hygiene *= 2 if level_duplicate?(@food, @fun, @hygiene)
    return @hygiene += 1 if level_max_different_than?(@food, @fun) && level_item_smaller_than_four?(@hygiene)
    return @hygiene += 1 if level_max_two_item?(@food, @fun) && level_item_equal_three_or_zero?(@hygiene)
  end

  def time_fun
    return @fun *= 2 if level_duplicate?(@hygiene, @food, @fun)
    return @fun += 1 if level_max_different_than?(@hygiene, @food) && level_item_smaller_than_four?(@fun)
    return @fun += 1 if level_max_two_item?(@hygiene, @food) && level_item_equal_three_or_zero?(@fun)
  end

  def time_food
    return @food *= 2 if level_duplicate?(@hygiene, @fun, @food)
    return @food += 1 if level_max_different_than?(@hygiene, @fun) && level_item_smaller_than_four?(@food)
    return @food += 1 if level_max_two_item?(@hygiene, @fun) && level_item_equal_three_or_zero?(@food)
  end

  def level_item_smaller_than_four?(item)
    return true if item < 4

    false
  end

  def level_max_two_item?(item1, item2)
    return true if item1 == 4 || item2 == 4

    false
  end

  def level_max_different_than?(item1, item2)
    return true if item1 != 4 || item2 != 4

    false
  end

  def level_item_smaller_three_and_greater_zero?(item)
    return true if item < 3 && item > 0

    false
  end

  def level_item_equal_three_or_zero?(item)
    return true if item == 3 || item.zero?

    false
  end

  def level_duplicate?(item1, item2, item3)
    return true if level_max_two_item?(item1, item2) && level_item_smaller_three_and_greater_zero(item3)

    false
  end

  def level_increment_1?(item1, item2, item3)
    return true if level_max_different_than?(item1, item2) && level_item_smaller_than_four?(item3)

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
