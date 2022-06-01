require 'rails_helper'

RSpec.describe 'manage reward process', type: :system do
  let(:admin) { create(:admin) }
  

  before do
    sign_in admin
    create(:reward)
    visit admins_rewards_path
  end

  it 'creates new reward' do
    click_link('New Reward')
    fill_in 'Title', with: 'System spec:Test Reward Title'
    fill_in 'Description', with: 'System spec:Test Description'
    fill_in 'Price', with: 1.32
    click_button 'Create Reward'
    expect(page).to have_content 'System spec:Test Reward Title'
  end

  it 'edits reward' do
    click_link('Edit')
    fill_in 'Title', with: 'Edit:Test Reward Title'
    click_button 'Update Reward'
    expect(page).to have_content 'Edit:Test Reward Title'
  end

  it 'destroys reward' do
    click_link('Destroy')
    expect(page).to have_no_content 'Test Reward Title'
  end
end
