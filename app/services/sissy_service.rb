class SissyService
  include Sissy::ComputeGlobalScore
  include Sissy::Create
  include Sissy::HandleWill
  include Sissy::Recruit

  def initialize sissy=nil, player: nil
    @sissy  = sissy
    @player = player
  end

  private

  attr_reader :sissy, :player

end
