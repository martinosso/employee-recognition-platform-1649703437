require 'rails_helper'

RSpec.describe 'reward test' do
  let(:employee) { create(:employee) }
  
  before do
    sign_in employee
    create(:reward)
  end

  it 'lists rewards' do
    visit rewards_path
    expect(page).to have_content(Reward.first.title)
    expect(page).to have_content(Reward.first.price)
  end

  it 'shows reward' do
    visit rewards_path
    click_link 'Show'
    expect(page).to have_content(Reward.first.description)
    expect(page).to have_content(Reward.first.title)
  end
end
