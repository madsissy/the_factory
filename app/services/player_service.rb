class PlayerService
  include Player::HandleEnergy

  def initialize player=nil
    @player = player
  end

  private

  attr_reader :player

end
