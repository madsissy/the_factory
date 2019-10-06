module Sissy::Recruit

  def recruit
    # First simple rule before evolution to a complex system with items
    result = (player.intimidation >= sissy.will) || (player.seduction >= sissy.will)

    sissy.update(owned: true, location: 'in_factory') if result

    result
  end
end
