require './lib/monster'
require './lib/necessity'
require './lib/time_stage'

class Game
  def initialize
    puts 'Name of Monster'
    name = gets.chomp
    @monster = Monster.new(name)
    @necessity = Necessity.new
  end

  def initialize_thread
    @thread1 = Thread.new do
      time = TimeStage.new
      time.every_so_many_seconds(50) do
        break if level_max?
        puts "=============================================================="
        puts "[PASSADO] O nível de higiêne estava em: #{@necessity.hygiene}"
        @necessity.time_hygiene
        puts "[PRESENTE] O nível de higiêne está em: #{@necessity.hygiene}"
        puts "=============================================================="
      end
    end

    @thread2 = Thread.new do
      time = TimeStage.new
      time.every_so_many_seconds(30) do
        break if level_max?
        puts "=============================================================="
        puts "[PASSADO] O nível de comida estava em: #{@necessity.food}"
        @necessity.time_food
        puts "[PRESENTE] O nível de comida está em: #{@necessity.food}"
        puts "=============================================================="
      end
    end

    @thread3 = Thread.new do
      time = TimeStage.new
      time.every_so_many_seconds(10) do
        endgame
        break if level_max?
        puts "=============================================================="
        puts "[PASSADO] O nível de diversão estava em: #{@necessity.fun}"
        @necessity.time_fun
        puts "[PRESENTE] O nível de diversão está em: #{@necessity.fun}"
        puts "=============================================================="
      end
    end
  end

  def initialize_game
    puts ''
    puts 'Iniciando...'
    puts '----Instruções----'
    puts 'A qualquer momento você poderá digiter a necessidade'
    puts "O monstrinho #{@monster.name} nasceu."
    puts '------ Seja Bem vindo ------'
    puts ''
  end

  def menu_options
    puts '=[1] - Alimentar - [2] Brincar - [3] Banho ='
    print 'Digite sua necessidade: '
    puts ''
  end

  def level_max?
    return true if @necessity.level_max

    false
  end

  def show_level
    puts "--------------------------------------------------------"
    puts "[PRESENTE] O nível de food está em: #{@necessity.food}"
    puts "[PRESENTE] O nível de diversão está em: #{@necessity.fun}"
    puts "[PRESENTE] O nível de higiêne está em: #{@necessity.hygiene}"
    puts "--------------------------------------------------------"
  end

  def options_game
    until level_max?
      menu_options
      options = gets.chomp

      case options.to_i
      when 1
        break if level_max?

        @necessity.eat
        show_level
      when 2
        break if level_max?

        @necessity.amuse
        show_level
      when 3
        break if level_max?

        @necessity.sanitize
        show_level
      when 4
        break
      else
        puts 'Opção errada.'
        break if level_max?
      end
    end
    exit_game_threads
  end

  def exit_game_threads
    @thread1.exit
    @thread2.exit
    @thread3.exit
  end

  def endgame
    @monster.death if level_max?
  end

  def start
    initialize_thread
    initialize_game
    options_game
  end
end





