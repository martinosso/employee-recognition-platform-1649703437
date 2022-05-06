require 'rails_helper'

RSpec.describe 'the RUD employees process' do
  let(:admin) { create(:admin) }
  let!(:employee) { create(:employee) }

  before do
    sign_in admin
  end

  it do
    visit admins_employees_path
    expect(page).to have_content(employee.email)

    click_link('Edit')
    fill_in 'Email', with: 'email@test.com'
    click_button('Update Employee')
    expect(page).to have_content('email@test.com')

    click_link('Destroy')
    expect(page).to have_content('Employee successfully destroyed.')
  end
end
