module Player::Init

  def init params
    player = user.players.build(params)

    player.wallet_amount = 5000
    player.current_date  = Date.new(2031, 6, 21)
    player.energy        = 10
    player.seduction     = 30
    player.intimidation  = 30

    if player.save
      player.create_house(upkeep: 100, level: 1)
      player.create_factory(upkeep: 100, level: 1)
    end

    player
  end
end
