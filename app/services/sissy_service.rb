class SissyService
  include Sissy::Create
  include Sissy::ComputeGlobalScore

  def initialize sissy=nil, player: nil
    @sissy  = sissy
    @player = player
  end

  private

  attr_reader :sissy, :player

end
