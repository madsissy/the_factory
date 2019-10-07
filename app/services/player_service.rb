class PlayerService
  include Player::HandleEnergy
  include Player::HandleSleep

  def initialize player=nil
    @player = player
  end

  private

  attr_reader :player

end