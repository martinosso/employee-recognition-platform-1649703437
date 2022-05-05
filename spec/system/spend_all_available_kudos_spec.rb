require 'rails_helper'

RSpec.describe 'the spend all available kudos process' do
  let(:employee) { create(:employee) }
  let(:employee2) { create(:employee) }

  before do
    sign_in employee
  end

  it 'running out of available kudos' do
    visit kudos_path
    (0..10).each do |i|
      click_link('New Kudo')
      fill_in 'Title', with: 'System test title'"#{i}"
      fill_in 'Content', with: 'Test content'"#{i}"
      click_button 'Create Kudo'
      if i < 10
        expect(page).to have_content 'Test content'"#{i}"
      else
        expect(page).to have_content 'You don\'t have available kudos!'
      end
    end
  end
end
