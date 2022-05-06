class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :number_of_available_kudos, presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
