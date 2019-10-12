module Player::HandleMoney

  def handle_money integer
    unless !player.enough_fund?(integer.abs)
      player.wallet_amount += integer

      player.save!
    else
      false
    end
  end
end
