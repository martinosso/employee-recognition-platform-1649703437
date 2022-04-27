require 'rails_helper'

RSpec.describe 'the sign in process', type: :feature do
  before do
    Admin.create(email: 'admin@test.com', password: 'password')
  end

  it 'signs admin in' do
    visit 'admins'
    within('#new_admin') do
      fill_in 'Email', with: 'admin@test.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in as admin successfully.'
  end
end
