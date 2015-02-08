class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings

  def ate_at_yesterday
    last_visited = self.ratings.where(last_visited: Date.today-1)
    unless last_visited.empty?
      last_visited.first.restaurant
    else nil; end
  end

  # From a user's ratings, returns the largest number of days since he/she
  # has eaten at any restaurant. Returns +nil+ if the user has no ratings.
  def last_visited_max
    ratings = self.ratings

    if ratings.empty?
      nil
    else
      ratings.map { |rating| Integer(Date.today - rating.last_visited) }.max
    end
  end
end