class Main

  def status_level
    puts ''
    puts '==================================================='
    puts "O nível de higiêne está em: #{necessity.level_hygiene}"
    puts "O nível de comida está em: #{necessity.level_food}"
    puts "O nível de diversão está em: #{necessity.level_fun}"
    puts '==================================================='
    puts ''
  end

  def menu_text
    puts '================================================================================='
    puts '=================[1] - Alimentar - [2] Brincar - [3] Banho ======================'
    puts '==============================================================================='
    puts 'Qual necessidade você deseja?'
    puts ''
  end

  def menu_options
    case @options.to_i
    when 1
      necessity.eat
    when 2
      necessity.amuse
    when 3
      necessity.sanitize
    when 4
      break
    else
      'Opção inválida.'
    end
  end

  def die_message
    puts 'Seu bichinho morreu, tente novamente'
  end

  def action_monster
    puts 'Name of Monster'
    @name = gets.chomp
    @monster = Monster.new(@name)
    @necessity = Necessity.new
  end

  def threads_necessity
    thread_fun
    thread_food
    thread_hygiene
  end

  def exit_threads
    @thread1.exit
    @thread2.exit
    @thread3.exit
  end

  def thread_fun
    @thread1 = Thread.new do
      until @necessity.level_max do
        sleep 10
        @necessity.time_fun
      end
    end
  end

  def thread_food
    @thread2 = Thread.new do
      until @necessity.level_max do
        sleep 30
        @necessity.time_food
      end
    end
  end

  def thread_hygiene
    @thread3 = Thread.new do
      until @necessity.level_max do
        sleep 50
        @necessity.time_hygiene
      end
    end
  end
end

main = Main.new
