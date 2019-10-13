require 'rails_helper'

RSpec.describe SissyJob, type: :model do

  describe 'relations' do
    it { is_expected.to belong_to(:job) }
    it { is_expected.to belong_to(:sissy) }
  end

end
