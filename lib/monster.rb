require 'byebug'

class Monster

  def initialize(name)
    @name = name
    @life = Time.now
  end

  def name
    @name
  end

  def show_life
    (Time.now.to_i - @life.to_i)
  end

  def death
    puts "Tempo de vida: #{show_life} segundos"
    puts 'Seu bichinho morreu, tente novamente'
  end
end
