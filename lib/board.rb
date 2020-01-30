require_relative 'boardcase'
require_relative 'player'

class Board

  attr_accessor :cases


  def initialize
    @cases = [BoardCase.new(), BoardCase.new(), BoardCase.new(), BoardCase.new(), BoardCase.new() ,BoardCase.new(), BoardCase.new(), BoardCase.new(), BoardCase.new()]
  end

  def convert(choice)
    case choice
    when "A1" then return 0
    when "A2" then return 1
    when "A3" then return 2
    when "B1" then return 3
    when "B2" then return 4
    when "B3" then return 5
    when "C1" then return 6
    when "C2" then return 7
    when "C3" then return 8
    else return -1
    end
  end

  def play_turn (player)
    puts "#{player.name} c'est à toi. Quelle case veux tu ?"
    choice = gets.chomp
    choice = convert(choice)
    if (choice == -1)
      puts "la case n'existe pas. Réessaie"
      return play_turn(player)
    end
    if (@cases[choice].free == false)
      puts "désolé, case déja prise, retente"
      return play_turn(player)
    end
    @cases[choice].value = player.value
  end

  def show
    3.times do |i|
      print "#{@cases[3*i].value}"
      print "|"
      print "#{@cases[3*i+1].value}"
      print "|"
      print "#{@cases[3*i+2].value}"
      puts ""
    end
  end

  def victory?(player)
    3.times do |i|
      if (player.value == cases[3*i].value && player.value == cases[3*i+1].value && player.value == cases[3*i+2].value)
        return true
      end
    end
    3.times do |i|
      if (player.value == cases[i].value && player.value == cases[i+3].value && player.value == cases[i+6].value)
        return true
      end
    end
    if (player.value == cases[0].value && player.value == cases[4].value && player.value == cases[8].value)
      then return true
    end
    if (player.value == cases[2].value && player.value == cases[4].value && player.value == cases[6].value)
      then return true
    end
    return false
  end
end
