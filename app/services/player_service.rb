class PlayerService
  include Player::HandleEnergy
  include Player::HandleMoney
  include Player::HandleSleep
  include Player::Init

  def initialize player=nil, user:nil
    @player = player
    @user   = user
  end

  private

  attr_reader :player, :user

end
