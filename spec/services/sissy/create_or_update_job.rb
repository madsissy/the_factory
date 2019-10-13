require 'rails_helper'

RSpec.describe Sissy::CreateOrUpdateJob do
  let(:sissy)     { create(:sissy, will: 20, sub_skill: 60) }
  let(:maid_job)  { create(:job, :maid) }
  let(:other_job) { create(:job) }
  subject         { SissyService.new(sissy) }

  describe 'create_or_update_job' do
    context 'has required stats but no job' do
      it 'creates sissy job and set it to current' do
        expect(subject.create_or_update_job(maid_job.name)).to eq true
        expect(sissy.current_job.job                      ).to eq maid_job
        expect(sissy.current_job.experience               ).to eq 0
      end
    end

    context 'has required stats and the job already' do
      before{ sissy.sissy_jobs.create(job: maid_job, experience: 30, current_job: false) }

      it 'updates job and set it to current' do
        expect(subject.create_or_update_job(maid_job.name)).to eq true
        expect(sissy.current_job.job                      ).to eq maid_job
        expect(sissy.current_job.experience               ).to eq 30
      end
    end

    context 'has required stats and another job' do
      before{ sissy.sissy_jobs.create(job: other_job, experience: 30, current_job: true) }

      it 'creates new sissy job and sets current of the other to false' do
        expect(subject.create_or_update_job(maid_job.name)).to eq true
        expect(sissy.current_job.job                      ).to eq maid_job
        expect(sissy.current_job.experience               ).to eq 0
        expect(sissy.sissy_jobs.first.current_job         ).to eq false
      end
    end

    context 'dont have required stats' do
      before { sissy.update(will: 60, sub_skill: 10) }

      it 'dont creates sissy job' do
        expect(subject.create_or_update_job(maid_job.name)).to eq false
        expect(sissy.current_job                          ).to eq nil
      end
    end
  end

end
