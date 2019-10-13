require 'rails_helper'

RSpec.describe Job, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:will_needed) }
    it { is_expected.to validate_presence_of(:sub_skill_needed) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

end
