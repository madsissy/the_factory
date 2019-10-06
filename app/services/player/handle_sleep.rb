module Player::HandleSleep

  def handle_sleep
    # Maybe handle sleep by hours in the future
    player.update!(current_date: player.current_date + 1.day, energy: 10)
  end
end
