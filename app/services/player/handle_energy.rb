module Player::HandleEnergy

  def handle_energy integer
    player.energy += integer

    player.energy = 0   if player.energy < 0
    player.energy = 10  if player.energy > 10

    player.save!
  end
end
