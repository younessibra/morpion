require_relative 'boardcase'
require_relative 'player'

class Board
  #TO DO : la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué

  attr_accessor :cases


  def initialize
    @cases = [BoardCase.new("A1"), BoardCase.new("A2"), BoardCase.new("A3"), BoardCase.new("B1"), BoardCase.new("B2") ,BoardCase.new("B3"), BoardCase.new("C1"), BoardCase.new("C2"), BoardCase.new("C3")]
    #TO DO :
    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
    #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
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
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
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
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
  end
end
