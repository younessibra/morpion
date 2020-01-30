require_relative 'board'
require_relative 'player'

class Game
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :current_player, :status, :board, :player1, :player2, :continue, :cpt
  def initialize
    @continue = true
    puts "nom du premier joueur"
    name = gets.chomp
    @player1 = Player.new(name, "X")
    puts "nom du second joueur"
    name = gets.chomp
    @player2 = Player.new(name, "O")
    @board = Board.new()
    @status = "ongoing"
    @current_player = @player1
    @cpt = 0
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
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
    #TO DO : méthode faisant appelle aux méthodes des autres classes (notamment à l'instance de Board). Elle affiche le plateau, demande au joueur ce qu'il joue, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie.
  end

  def new_round
    @board = Board.new
    # TO DO : relance une partie en initialisant un nouveau board mais en gardant les mêmes joueurs.
  end

  def game_end
    puts "Voici le schéma final"
    @board.show
    puts "Si vous ne le voulez pas rejouer, tapez 'n'. Sinon tapez n'importe quoi"
    choice = gets.chomp
    if choice == 'n'
      then @continue = false
    end
    # TO DO : permet l'affichage de fin de partie quand un vainqueur est détecté ou si il y a match nul
  end    

end
