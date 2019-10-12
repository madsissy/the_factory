module Player::HandleEnergy

  def handle_energy integer
    unless integer < 0 && !@player.enough_energy?(integer.abs)
      player.energy += integer

      player.energy = 10  if player.energy > 10

      player.save!
    else
      false
    end
  end
end
