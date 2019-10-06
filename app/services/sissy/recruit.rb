module Sissy::Recruit

  def recruit
    # First simple rule before evolution to a complex system with items
    (player.intimidation >= sissy.will) || (player.seduction >= sissy.will)
  end
end
