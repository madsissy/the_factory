module Sissy::Recruit

  def recruit
    # First simple rule before evolution to a complex system with items
    result = (player_intimidation_score >= sissy.will) || (player.seduction >= sissy.will)

    sissy.update(owned: true, location: 'in_factory') if result

    result
  end

  def player_intimidation_score
    player.weapon ? (player.intimidation + player.weapon.modifier) : player.intimidation
  end
end
