require 'rails_helper'

RSpec.describe DayRecap::Update do
  let(:player)    { create(:initialized_player, current_date: Time.new(2032, 1, 1), wallet_amount: 300) }
  let(:sissy)     { create(:sissy, :with_jobs, jobs: [create(:job, :prostitute)], player: player) }
  subject         { DayRecapService.new(player.day_recap, player: player) }

  describe 'update' do
    before { sissy.sissy_jobs.first.update(current_job: true) }

    context 'success on day_recap & player save' do
      it 'updates a day recap, save player and return true' do
        expect(subject.update             ).to eq true
        expect(player.day_recap.recap_day ).to eq Time.new(2031, 12, 31)
        expect(player.day_recap.losses    ).to eq 200
        expect(player.day_recap.earnings  ).to eq 100
        expect(player.day_recap.total     ).to eq -100
      end
    end

    context 'day_recap updates fails and return false' do
      before{ allow(player.day_recap).to receive(:update!).and_return(false) }

      it 'dont update players wallet amount' do
        expect(subject.update      ).to eq false
        expect(player.wallet_amount).to eq 300
      end
    end

    context 'player save fails and return false' do
      before{
        allow(player).to receive(:save!).and_return(false)
        player.day_recap.update(total: 100)
       }

      it 'dont save wallet amount, rollback day_recap & return false' do
        expect(subject.update).to eq nil
        player.reload

        expect(player.wallet_amount      ).to eq 300
        expect(player.day_recap.total    ).to eq 100
      end
    end
  end

end
