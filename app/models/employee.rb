class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :number_of_available_kudos, presence: true
  has_many :given_kudos, class_name: 'Kudo', foreign_key: 'giver_id', inverse_of: 'giver', dependent: :destroy
  has_many :received_kudos, class_name: 'Kudo', foreign_key: 'receiver_id', inverse_of: 'receiver', dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
