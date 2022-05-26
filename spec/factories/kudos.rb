FactoryBot.define do
  factory :kudo do
    title { 'Testtitle' }
    content { 'fcontent' }
    giver { create(:employee) }
    receiver { create(:employee) }
    company_value
  end
end
