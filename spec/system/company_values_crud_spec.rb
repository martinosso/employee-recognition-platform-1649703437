require 'rails_helper'

RSpec.describe 'company values CRUD actions process', type: :system do
  let(:admin) { create(:admin) }
  let!(:companyvalue) { create(:company_value) }

  before do
    sign_in admin
    visit admins_company_values_path
  end

  it 'create action' do
    click_link 'New Company Value'
    fill_in 'Title', with: 'TestCVTitle'
    click_button 'Create Company value'
    expect(page).to have_content('Company value successfully created!')
  end

  it 'read action' do
    click_link 'Show'
    expect(page).to have_content('Back')
  end

  it 'update action' do
    click_link 'Edit'
    fill_in 'Title', with: 'UpdateAction'
    click_button 'Update Company value'
    expect(page).to have_content('UpdateAction')
  end

  it 'destroy action' do
    click_link 'Destroy'
    expect(page).to have_content('Company value successfully destroyed!')
  end
end
