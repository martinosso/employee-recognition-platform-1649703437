require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'returns the email' do
    employee = create(:employee)

    expect(employee.email).to eq 'email1@test.com'
  end
end
