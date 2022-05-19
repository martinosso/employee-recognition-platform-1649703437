# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
1.upto(5) do |l|
    Employee.create!(email: "employee#{l}@test.com", password: 'password')
end

Kudo.create(title: 'From seeds', content: 'Something', giver: Employee.find_by(email: 'employee1@test.com'), receiver: Employee.find_by(email: 'employee3@test.com'))

Admin.create(email: "admin@test.com", password: 'password')

companyvalues = ['Honesty', 'Ownership', 'Accountability', 'Passion']
companyvalues.each do |t|
  CompanyValue.create(title: t)
end
