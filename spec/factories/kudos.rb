FactoryBot.define do
  factory :kudo do
    title { 'Testtitle' }
    content { 'fcontent' }
    giver { Employee.create(email: 'test@test.com', password: 'password') }
    receiver { Employee.create(email: 'test2@test.com', password: 'password') }
  end
end
