require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :board, :player1, :player2, :continue, :cpt
  def initialize
    @continue = true
    puts "nom du premier joueur"
    name = gets.chomp
    @player1 = Player.new(name, "X")
    puts "nom du second joueur"
    name = gets.chomp
    @player2 = Player.new(name, "O")
    @board = Board.new()
    @cpt = 0
  end

  def turn
    @board.show
    @board.play_turn(@player1)
    if @board.victory?(@player1)
      puts "#{player1.name} a gagné"
      game_end
      new_round
      return
    end
    @cpt +=1
    if (@cpt == 9)
      puts "Match nul !"
      game_end
      new_round
      return
    end
    @board.show
    @board.play_turn(@player2)
    if @board.victory?(@player2)
      puts "#{player2.name} a gagné"
      game_end
      new_round
      return
    end
    @cpt +=1
    if (@cpt == 9)
      puts "Match nul !"
      game_end
      new_round
      return
    end
  end

  def new_round
    @board = Board.new
  end

  def game_end
    @cpt = 0
    puts "Voici le schéma final"
    @board.show
    puts "Si vous ne le voulez pas rejouer, tapez 'n'. Sinon tapez n'importe quoi"
    choice = gets.chomp
    if choice == 'n'
      then @continue = false
    end
  end    

end
