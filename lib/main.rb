require './lib/monster'
require './lib/necessity'

puts 'Name of Monster'
name = gets.chomp

monster = Monster.new(name)
necessity = Necessity.new

Thread.new do
  until necessity.level_max do
    sleep 50
    necessity.time_hygiene
    puts "#{necessity.level_fun}"
    puts "O nível de higiêne está em: #{necessity.level_hygiene}"
  end
end

Thread.new do
  until necessity.level_max do
    sleep 30
    necessity.time_food
    puts "O nível de comida está em: #{necessity.level_food}"
  end
end

Thread.new do
  until necessity.level_max do
    sleep 10
    necessity.time_fun
    puts "O nível de diversão está em: #{necessity.level_fun}"
    puts "Retorno de level: #{necessity.level_max}"
  end
end


puts 'Iniciando...'
puts '------ Seja Bem vindo ------'

puts monster.name
until necessity.level_max do
  # puts '================================================================================='
  # puts '====[1] - Alimentar - [2] Brincar - [3] Banho - [4] Sair do jogo================='
  #   puts '================================================================================='
  #   puts 'Qual necessidade você deseja?'
  #   options = gets.chomp
  #   case options.to_i
  #   when 1
  #     necessity.eat
  #   when 2
  #     necessity.amuse
  #   when 3
  #     necessity.sanitize
  #   when 4
  #     exit_program = false
  #     break
  #   else
  #     'Opção inválida.'
  #   end
end
puts 'Seu bichinho morreu, tente novamente'
