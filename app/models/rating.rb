class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :rate, inclusion: 1..5, numericality: { only_integer: true }, presence: true
  validates :last_visited, presence: true
  validate :last_visited_must_be_in_past

  private
  def last_visited_must_be_in_past
    if self.last_visited && (self.last_visited > Date.today)
      errors.add(:last_visited, 'must be today or in the past.')
    end
  end
end