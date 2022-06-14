class Kudo < ApplicationRecord
  belongs_to :giver, class_name: 'Employee'
  belongs_to :receiver, class_name: 'Employee'
  belongs_to :company_value

  validates :title, :content, presence: true

  after_create do
    self.receiver.increment(:earned_points, 100).save
  end

  after_destroy do
    self.receiver.decrement(:earned_points, 100).save
  end
end
