require 'byebug'

class Monster

  def initialize(name)
    @name = name
    @life = Time.now
  end

  def name
    @name
  end

  def death
    puts "#{@life - Time.now}"
    puts 'Seu bichinho morreu, tente novamente'
  end
end
