require 'rails_helper'

RSpec.describe 'manage kudo process', type: :system do
  let(:employee) { create(:employee) }
  let!(:employee2) { create(:employee) }
  let!(:kudo) { create(:kudo, giver: employee, receiver: employee2) }

  before do
    sign_in employee
    visit kudos_path
  end

  it 'checks increment earned points of receiver' do
    expect(employee2.earned_points.amount).to eq 1.0
  end

  it 'creates new kudo' do
    click_link('New Kudo')
    fill_in 'Title', with: 'Test title'
    fill_in 'Content', with: 'Test content'
    select CompanyValue.first.title, from: 'Company value'
    select employee2.email, from: 'Receiver'
    click_button 'Create Kudo'
    expect(page).to have_no_content 'Company value must exist'
    expect(page).to have_content 'Test content'
  end

  it 'edits kudo' do
    click_link('Edit')
    fill_in 'Content', with: 'New content'
    click_button 'Update Kudo'
    expect(page).to have_content 'New content'
  end

  it 'destroys kudo' do
    click_link('Destroy')
    expect(page).to have_content 'Kudo was successfully destroyed.'
    kudo.destroy
    expect(employee2.earned_points.amount).to eq 0.0
  end
end
