class DayRecapService
  include DayRecap::Update

  def initialize day_recap, player:nil
    @day_recap  = day_recap
    @player     = player
  end

  private

  attr_reader :player, :day_recap

end
