class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ratings

  def ate_at_yesterday
    unless (last_visited = self.ratings.where(last_visited: Date.today-1)).empty?
      last_visited.first.restaurant
    else nil; end
  end
end