require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'returns admin\'s email' do
    admin = create(:admin)

    expect(admin.email).to eq 'admin@test.com'
  end
end
