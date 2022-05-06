require 'rails_helper'

RSpec.describe '.authenticate', type: :system do
  before do
    Employee.create(email: 'test@test.com', password: 'password')
  end

  it do
    visit 'employees/sign_in'
    within('#new_employee') do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
