require 'rails_helper'

RSpec.describe SissiesHelper do
  let(:sissy) { build(:sissy) }

  describe '#height_in_words' do
    it 'returns a word for sissy\'s height' do
      sissy.height = 150
      expect(height_in_words(sissy)).to eq 'small'
      sissy.height = 166
      expect(height_in_words(sissy)).to eq 'average'
      sissy.height = 181
      expect(height_in_words(sissy)).to eq 'tall'
    end
  end

  describe '#weight_in_words' do
    it 'returns a word for sissy\'s weight' do
      sissy.weight = 50
      expect(weight_in_words(sissy)).to eq 'thin'
      sissy.weight = 95
      expect(weight_in_words(sissy)).to eq 'average'
      sissy.weight = 96
      expect(weight_in_words(sissy)).to eq 'fat'
    end
  end

  describe '#hair_length_in_words' do
    it 'returns a word for sissy\'s hair_length' do
      sissy.hair_length = 0
      expect(hair_length_in_words(sissy)).to eq 'shaved'
      sissy.hair_length = 1
      expect(hair_length_in_words(sissy)).to eq 'very short'
      sissy.hair_length = 11
      expect(hair_length_in_words(sissy)).to eq 'short'
      sissy.hair_length = 31
      expect(hair_length_in_words(sissy)).to eq 'shoulder length'
      sissy.hair_length = 61
      expect(hair_length_in_words(sissy)).to eq 'long'
      sissy.hair_length = 91
      expect(hair_length_in_words(sissy)).to eq 'very long'
    end
  end

  describe '#penis_size_in_words' do
    it 'returns a word for sissy\'s penis_size' do
      sissy.penis_size = 1
      expect(penis_size_in_words(sissy)).to eq 'micro'
      sissy.penis_size = 5
      expect(penis_size_in_words(sissy)).to eq 'tiny'
      sissy.penis_size = 10
      expect(penis_size_in_words(sissy)).to eq 'small'
      sissy.penis_size = 13
      expect(penis_size_in_words(sissy)).to eq 'average'
      sissy.penis_size = 19
      expect(penis_size_in_words(sissy)).to eq 'big'
      sissy.penis_size = 24
      expect(penis_size_in_words(sissy)).to eq 'huge'
    end
  end

  describe '#attractiveness_in_words' do
    it 'returns a word for sissy\'s attractiveness' do
      sissy.attractiveness = 0
      expect(attractiveness_in_words(sissy)).to eq 'ugly'
      sissy.attractiveness = 26
      expect(attractiveness_in_words(sissy)).to eq 'quite ugly'
      sissy.attractiveness = 51
      expect(attractiveness_in_words(sissy)).to eq 'quite attractive'
      sissy.attractiveness = 76
      expect(attractiveness_in_words(sissy)).to eq 'attractive'
    end
  end

  describe '#eyes_colors_in_words' do
    it 'return the color as a string' do
      sissy.blue_eyes!
      expect(eyes_colors_in_words sissy.eyes_color).to eq 'blue'
    end
  end

  describe '#hair_color_in_words' do
    it 'return the color as a string' do
      sissy.blond_hair!
      expect(hair_color_in_words sissy.hair_color).to eq 'blond'
    end
  end
end
