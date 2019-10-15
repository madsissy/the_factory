module DayRecap::Update

  def update
    ActiveRecord::Base.transaction do
      return false unless update_day_recap

      player.wallet_amount += day_recap.total

      raise ActiveRecord::Rollback unless player.save!

      true
    end
  end

  private

  def compute_earnings
    # TODO: More complex rule with each worker
    @earnings ||= player.sissies.prostitutes.count * 100
  end

  def compute_losses
    @losses ||= player.factory.upkeep + player.house.upkeep
  end

  def update_day_recap
    day_recap.update!(
      recap_day: player.current_date - 1.day,
      earnings: compute_earnings,
      losses: compute_losses,
      total: compute_earnings - compute_losses
    )
  end
end
