require 'rails_helper'

RSpec.describe Reward, type: :model do
  describe 'validations' do
    subject { build(:reward) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
