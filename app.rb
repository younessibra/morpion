require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/boardcase'
class Application
  def perform
    # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    # 
    game = Game.new()
    while (game.continue == true)
      game.turn
    end
  end

end


Application.new.perform