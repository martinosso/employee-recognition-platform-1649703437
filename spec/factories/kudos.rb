FactoryBot.define do
  factory :kudo do
    title { 'Testtitle' }
    content { 'fcontent' }
    if Employee.find_by(email: 'test2338@test.com')
      giver { Employee.find_by(email: 'test2338@test.com') }
      receiver { Employee.find_by(email: 'test2484@test.com') }
    else
      giver { Employee.create!(email: 'test2338@test.com', password: 'password') }
      receiver { Employee.create!(email: 'test2484@test.com', password: 'password') }
    end
  end
end
