require 'rails_helper'

RSpec.describe 'orders test process' do
  let(:employee) { create(:employee, earned_points: 200) }
  let!(:reward) { create(:reward) }

  before do
    sign_in employee
    visit rewards_path
  end

  it 'creates order' do
    click_link 'Buy now'
    employee.reload
    expect(page).to have_content("Earned points: #{(100 * employee.earned_points).to_i}")
  end
end
