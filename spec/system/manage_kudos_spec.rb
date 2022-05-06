require 'rails_helper'

RSpec.describe 'create new kudo process', type: :system do
  before do
    employee = Employee.create(email: 'test@test.com', password: 'password')
    Employee.create(email: 'test2@test.com', password: 'password')
    sign_in employee
  end

  it 'manages kudo' do
    visit kudos_path
    # Creates new kudo
    click_link('New Kudo')
    fill_in 'Title', with: 'System test title'
    fill_in 'Content', with: 'Test content'
    click_button 'Create Kudo'
    expect(page).to have_content 'Test content'

    # Edits kudo
    click_link('Edit')
    fill_in 'Content', with: 'New content'
    click_button 'Update Kudo'
    expect(page).to have_content 'Kudo was successfully updated.'

    # Destroys kudo
    visit kudos_path
    click_link('Destroy')
    expect(page).to have_content 'Kudo was successfully destroyed.'
  end
end
