FactoryBot.define do
  factory :order do
    employee { create(:employee) }
    reward { create(:reward) }
  end
end
