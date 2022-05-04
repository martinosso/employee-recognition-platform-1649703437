require 'rails_helper'

RSpec.describe 'the kudo listing and deleting process', type: :system do
  let(:admin) { create(:admin) }
  before do
    sign_in admin
  end
  kudo = FactoryBot.create :kudo

  it 'destroys kudo' do
    visit admins_kudos_path
    expect(page).to have_content 'Testtitle'
    click_link('Destroy')
    expect(page).to have_content('Kudo was successfully destroyed.')
  end
end
