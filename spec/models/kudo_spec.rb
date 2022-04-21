require 'rails_helper'

RSpec.describe Kudo, type: :model do
    it 'returns the title' do
        kudo = create(:kudo)

        expect(kudo.title).to eq 'Testtitle'
    end
end