module DayRecap::Update

  def update
    day_recap.update(
      recap_day: player.current_date - 1.day,
      earnings: compute_earnings,
      losses:   compute_losses,
      total:    compute_earnings - compute_losses
    )

    player.wallet_amount += day_recap.total
    player.save
  end

  private

  def compute_earnings
    # TODO: More complex rule with each worker
    @earnings ||= players.sissies.prostitutes.count * 100
  end

  def compute_losses
    @losses ||= player.factory.upkeep + player.house.upkeep
  end
end
