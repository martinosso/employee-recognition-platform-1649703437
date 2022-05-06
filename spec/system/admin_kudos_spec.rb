require 'rails_helper'

RSpec.describe 'the kudo RD process', type: :system do
  let(:admin) { create(:admin) }
  let!(:kudo) { create(:kudo) }

  before do
    sign_in admin
  end

  it 'destroys kudo' do
    visit admins_kudos_path
    expect(page).to have_content 'Testtitle'
    click_link('Destroy')
    expect(page).to have_content('Kudo was successfully destroyed.')
  end
end
