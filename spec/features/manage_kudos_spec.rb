require 'rails_helper'

RSpec.describe 'the sign in and create new kudo process', type: :feature do
  before do
    Employee.create(email: 'test@test.com', password: 'password')
    Employee.create(email: 'test2@test.com', password: 'password')
  end

  it 'signs in and creates new kudo' do
    # Signs in
    visit 'employees/sign_in'
    within('#new_employee') do
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
    end
    click_button 'Log in'
    expect(page).to have_content 'successfully'

    # Creates new kudo
    expect(page).to have_content 'Kudos'
    click_link('New Kudo', href: new_kudo_path)
    expect(page).to have_content 'New Kudo'
    fill_in 'Title', with: 'System test title'
    fill_in 'Content', with: 'Test content'
    click_button 'Create Kudo'
    expect(page).to have_content 'Kudo was successfully created.'
    expect(page).to have_content 'System test title'
    expect(page).to have_content 'Test content'

    # Edits kudo
    click_link('Edit')
    fill_in 'Content', with: 'New content'
    click_button 'Update Kudo'
    expect(page).to have_content 'Kudo was successfully updated.'
    expect(page).to have_content 'System test title'
    expect(page).to have_content 'New content'

    # Destroys kudo
    visit kudos_path
    click_link('Destroy')
    expect(page).to have_content 'Kudo was successfully destroyed.'
  end
end
