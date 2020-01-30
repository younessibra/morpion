require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/boardcase'
class Application
  def perform
    game = Game.new()
    while (game.continue == true)
      game.turn
    end
  end

end


Application.new.perform