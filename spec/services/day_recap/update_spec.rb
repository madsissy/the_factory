require 'rails_helper'

RSpec.describe DayRecap::Update do
  let(:player)    { create(:initialized_player, current_date: Time.new(2032, 1, 1)) }
  let(:sissy)     { create(:sissy, :with_jobs, jobs: [create(:job, :prostitute)], player: player) }
  subject         { DayRecapService.new(player.day_recap, player: player) }

  describe 'update' do
    before { sissy.sissy_jobs.first.update(current_job: true) }
    it 'updates a day recap' do
      result = subject.update

      expect(player.day_recap.recap_day ).to eq Time.new(2031, 12, 31)
      expect(player.day_recap.losses    ).to eq 200
      expect(player.day_recap.earnings  ).to eq 100
      expect(player.day_recap.total     ).to eq -100
    end
  end

end
