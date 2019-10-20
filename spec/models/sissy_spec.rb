require 'rails_helper'

RSpec.describe Sissy, type: :model do
  describe 'constants' do
    it { expect(described_class).to have_constant(:WILL_THRESHOLD) }
    it { expect(described_class).to have_constant(:SUB_SKILL_THRESHOLD) }
  end

  describe 'relations' do
    it { is_expected.to belong_to(:player) }
    it { is_expected.to have_many(:sissy_jobs) }
    it { is_expected.to have_many(:jobs).through(:sissy_jobs) }
    it { is_expected.to have_one(:current_job).class_name('SissyJob') }
    it { is_expected.to have_one(:shoes).class_name('SissyClothe') }
    it { is_expected.to have_one(:outfit).class_name('SissyClothe') }
    it { is_expected.to have_one(:headgear).class_name('SissyClothe') }
  end

  describe 'scopes' do
    let(:prostitute_job)    { create(:job, :prostitute) }
    let(:maid_job)          { create(:job, :maid) }
    let!(:prostitute_sissy) { create(:sissy, :with_jobs, jobs: [prostitute_job]) }
    let!(:maid_sissy)       { create(:sissy, :with_jobs, jobs: [maid_job]) }
    it '#prostitutes' do
      prostitute_sissy.sissy_jobs.first.update(current_job: true)

      expect(described_class.prostitutes).to eq [prostitute_sissy]
    end

    it '#maids' do
      maid_sissy.sissy_jobs.first.update(current_job: true)

      expect(described_class.maids).to eq [maid_sissy]
    end
  end

  describe 'enums' do
    before { @sissy = build(:sissy) }

    it '#hair_color' do
      expect(@sissy.blond_hair!).to eq true
      expect(@sissy.blond_hair?).to eq true
      expect(described_class.hair_colors).to eq({"blond_hair"=>0, "blue_hair"=>9, "brown_hair"=>2, "dark_brown_hair"=>3, "ginger_hair"=>5, "green_hair"=>8, "jet_black_hair"=>4, "pink_hair"=>7, "platinum_blond_hair"=>1, "red_hair"=>6})
    end

    it '#eyes_color' do
      expect(@sissy.blue_eyes!).to eq true
      expect(@sissy.blue_eyes?).to eq true
      expect(described_class.eyes_colors).to eq({"black_eyes"=>1, "blue_eyes"=>3, "brown_eyes"=>0, "green_eyes"=>2, "grey_eyes"=>4})
    end

    it '#skin_color' do
      expect(@sissy.pale_skin!).to eq true
      expect(@sissy.pale_skin?).to eq true
      expect(described_class.skin_colors).to eq({"black_skin"=>3, "olive_skin"=>1, "pale_skin"=>0, "tanned_skin"=>2})
    end

    it '#testicles_size' do
      expect(@sissy.small_testicles!).to eq true
      expect(@sissy.small_testicles?).to eq true
      expect(described_class.testicles_sizes).to eq({"big_testicles"=>2, "huge_testicles"=>3, "micro_testicles"=>0, "small_testicles"=>1})
    end

    it '#breasts_size' do
      expect(@sissy.b_cup!).to eq true
      expect(@sissy.b_cup?).to eq true
      expect(described_class.breasts_sizes).to eq({"a_cup"=>1, "b_cup"=>2, "c_cup"=>3, "d_cup"=>4, "e_cup"=>5, "g_cup"=>6, "no_breasts"=>0})
    end

    it '#ass_size' do
      expect(@sissy.huge_ass!).to eq true
      expect(@sissy.huge_ass?).to eq true
      expect(described_class.ass_sizes).to eq({"bubble_butt_ass"=>2, "flat_ass"=>0, "huge_ass"=>3, "rounded_ass"=>1})
    end

    it '#lips_size' do
      expect(@sissy.thin_lips!).to eq true
      expect(@sissy.thin_lips?).to eq true
      expect(described_class.lips_sizes).to eq({"huge_lips"=>2, "plump_lips"=>1, "thin_lips"=>0})
    end

    it '#location' do
      expect(@sissy.in_house!).to eq true
      expect(@sissy.in_house?).to eq true
      expect(described_class.locations).to eq({"in_factory"=>1, "in_house"=>0})
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:firstname       ) }
    it { is_expected.to validate_presence_of(:lastname        ) }
    it { is_expected.to validate_presence_of(:birthdate       ) }
    it { is_expected.to validate_presence_of(:height          ) }
    it { is_expected.to validate_presence_of(:weight          ) }
    it { is_expected.to validate_presence_of(:hair_length     ) }
    it { is_expected.to validate_presence_of(:hair_color      ) }
    it { is_expected.to validate_presence_of(:eyes_color      ) }
    it { is_expected.to validate_presence_of(:skin_color      ) }
    it { is_expected.to validate_presence_of(:penis_size      ) }
    it { is_expected.to validate_presence_of(:testicles_size  ) }
    it { is_expected.to validate_presence_of(:breasts_size    ) }
    it { is_expected.to validate_presence_of(:ass_size        ) }
    it { is_expected.to validate_presence_of(:lips_size       ) }
    it { is_expected.to validate_presence_of(:attractiveness  ) }
    it { is_expected.to validate_presence_of(:feminity        ) }
    it { is_expected.to validate_presence_of(:will            ) }
    it { is_expected.to validate_presence_of(:oral_skill      ) }
    it { is_expected.to validate_presence_of(:anal_skill      ) }
    it { is_expected.to validate_presence_of(:sub_skill       ) }

    it { is_expected.to validate_numericality_of(:height        ).is_greater_than(149            ).is_less_than(191) }
    it { is_expected.to validate_numericality_of(:weight        ).is_greater_than(49             ).is_less_than(121) }
    it { is_expected.to validate_numericality_of(:penis_size    ).is_greater_than(0              ).is_less_than(31)  }
    it { is_expected.to validate_numericality_of(:hair_length   ).is_greater_than_or_equal_to(0  ).is_less_than(121) }
    it { is_expected.to validate_numericality_of(:attractiveness).is_greater_than_or_equal_to(0  ).is_less_than(101) }
    it { is_expected.to validate_numericality_of(:feminity      ).is_greater_than_or_equal_to(0  ).is_less_than(101) }
    it { is_expected.to validate_numericality_of(:will          ).is_greater_than_or_equal_to(0  ).is_less_than(101) }
    it { is_expected.to validate_numericality_of(:oral_skill    ).is_greater_than_or_equal_to(0  ).is_less_than(101) }
    it { is_expected.to validate_numericality_of(:anal_skill    ).is_greater_than_or_equal_to(0  ).is_less_than(101) }
    it { is_expected.to validate_numericality_of(:sub_skill     ).is_greater_than_or_equal_to(0  ).is_less_than(101) }
  end

  describe 'methods' do
    it '#full_name' do
      sissy = build(:sissy, firstname: 'Sissy', lastname: 'Lou')
      expect(sissy.full_name).to eq "Sissy Lou"

      sissy.surname = 'Slut'
      expect(sissy.full_name).to eq "Sissy 'Slut' Lou"
    end

    it '#age_from_birthdate' do
      player = create(:player)
      sissy = build(:sissy, birthdate: Date.new(2000, 6, 22), player: player)
      expect(sissy.age_from_birthdate).to eq 30
    end
  end

end
