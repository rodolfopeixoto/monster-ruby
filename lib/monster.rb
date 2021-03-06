require 'byebug'

class Monster
  attr_reader :name

  def initialize(name)
    @name = name
    @life = Time.now
  end

  def show_life
    (Time.now.to_i - @life.to_i)
  end

  def death
    puts "Tempo de vida: #{show_life} segundos"
    puts 'Seu bichinho morreu, tente novamente'
  end
end
