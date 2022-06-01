class Reward < ApplicationRecord
  validates :title, :description, presence: true
  validates :title, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  composed_of :price, class_name: 'Money', mapping: %w(price cents), converter: Proc.new { |value| Money.new(value) }
end
