class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :rate, inclusion: 1..10, numericality: { only_integer: true }
end