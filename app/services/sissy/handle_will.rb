module Sissy::HandleWill

  def handle_will integer
    sissy.will += integer

    sissy.will = 0    if sissy.will < 0
    sissy.will = 100  if sissy.will > 100

    sissy.save!
  end
end
