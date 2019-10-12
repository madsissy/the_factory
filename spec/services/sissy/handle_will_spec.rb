require 'rails_helper'

RSpec.describe Sissy::HandleWill do
  let(:sissy) { create(:sissy, will: 50) }
  subject     { SissyService.new(sissy) }

  describe 'Handle and caps sissys will' do
    it 'update will attributes' do
      expect(subject.handle_will(-5)).to eq true
      expect(sissy.will).to eq 45

      expect(subject.handle_will(5)).to eq true
      expect(sissy.will).to eq 50
    end

    it 'caps sissy will' do
      expect(subject.handle_will(-51)).to eq true
      expect(sissy.will).to eq 0

      expect(subject.handle_will(101)).to eq true
      expect(sissy.will).to eq 100
    end
  end

end
