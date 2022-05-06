require 'rails_helper'

RSpec.describe 'spend all available kudos' do
  let(:employee) { create(:employee) }
  let(:employee2) { create(:employee) }

  before do
    sign_in employee
  end

  it 'uses all available kudos' do
    (0..10).each do |i|
      visit kudos_path
      click_link('New Kudo')
      fill_in 'Title', with: 'System test title'"#{i}"
      fill_in 'Content', with: 'Test content'"#{i}"
      click_button 'Create Kudo'
      if i < 10
        expect(page).to have_content 'Test content'"#{i}"
      else
        expect(page).to have_content 'You can\'t do that!'
      end
    end
  end
end
