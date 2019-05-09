require './lib/monster'
require './lib/necessity'

class Game
  def initialize
    puts 'Name of Monster'
    name = gets.chomp
    @monster = Monster.new(name)
    @necessity = Necessity.new
  end

  def initialize_thread
    # @thread1 = Thread.new do
    #   until @necessity.level_max do
    #     puts "[PASSADO] O nível de comida estava em: #{@necessity.hygiene}"
    #     sleep 50
    #     @necessity.time_hygiene
    #     puts "[PRESENTE] O nível de higiêne está em: #{@necessity.hygiene}"
    #   end
    # end

    # @thread2 = Thread.new do
    #   until @necessity.level_max do
    #     puts "[PASSADO]  O nível de comida estava em: #{@necessity.food}"
    #     sleep 30
    #     @necessity.time_food
    #     puts "[PRESENTE] O nível de comida está em: #{@necessity.food}"
    #   end
    # end

    @thread3 = Thread.new do
      until @necessity.level_max do
        puts "[PASSADO] O nível de diversão estava em: #{@necessity.fun}"
        sleep 10
        @necessity.time_fun
        puts "[PRESENTE] O nível de diversão está em: #{@necessity.fun}"
      end
      @options = 4 if @necessity.level_max
    end

    @thread_check = Thread.new do
      until @necessity.level_max do
        @options = gets.chomp
      end
      @options = 4
    end
  end

  def initialize_game
    # puts 'Iniciando...'
    # puts '------ Seja Bem vindo ------'
  end

  def menu_options
    # puts '================================================================================='
    # puts '=================[1] - Alimentar - [2] Brincar - [3] Banho ======================'
    # puts '================================================================================'
    # puts 'Qual necessidade você deseja?'
    # puts ''
  end

  def options_game
    until @necessity.level_max do
      # @necessity.eat if @options.to_i == 1
      # @necessity.amuse if @options.to_i == 2
      # @necessity.sanitize if @options.to_i == 3
      # 'Opção errada.' if @options != 1 || @options != 2 || @options != 3 || @options != 4
      # break if @options.to_i == 4
      puts "Level(options_game): #{@necessity.level_max}"
      puts "Options valor(options_game): #{@options}"
    end
    exit_game_threads
  end

  def exit_game_threads
    if @necessity.level_max
      # @thread1.exit
      # @thread2.exit
      # @thread3.exit
      # @thread_check.exit
    end
  end

  def start
    initialize_thread
    initialize_game
    menu_options
    options_game
    monster.death
  end
end







