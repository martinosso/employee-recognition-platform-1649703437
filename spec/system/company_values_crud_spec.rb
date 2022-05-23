require 'rails_helper'

RSpec.describe 'company values CRUD actions process', type: :system do
  let(:admin) { create(:admin) }
  let!(:company_value) { create(:company_value) }

  before do
    sign_in admin
    visit admins_company_values_path
  end

  it 'creates action' do
    click_link 'New Company Value'
    fill_in 'Title', with: 'TestCVTitle'
    click_button 'Create Company value'
    expect(page).to have_content('TestCVTitle')
  end

  it 'reads action' do
    click_link 'Show'
    expect(page).to have_content('Title: ')
  end

  it 'updates action' do
    click_link 'Edit'
    fill_in 'Title', with: 'UpdateAction'
    click_button 'Update Company value'
    expect(page).to have_content('UpdateAction')
  end

  it 'destroys action' do
    click_link 'Destroy'
    expect(page).to have_no_content('Company Value Title')
  end
end
