class CompanyValue < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :kudos, class_name: 'Kudo', foreign_key: 'company_value_id', inverse_of: 'company_value', dependent: :destroy
end
