class Restaurant < ActiveRecord::Base
  has_many :ratings
  has_attached_file :avatar, default_url: '/images/missing.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true

  def avg_rating
    if !self.ratings.empty?
      ratings = self.ratings.pluck(:rate)
      ratings.inject(:+) / Float(ratings.count)
    else nil; end
  end

  def score(user)
    last_visited_max = user.last_visited_max
    ratings = user.ratings.where(restaurant_id: self.id)

    return 0.0 if ratings.empty? || last_visited_max.nil?

    rating = ratings.first
    days_since_last_visited = Integer(Date.today - rating.last_visited)
    score = (rating.rate / Float(5))*40 + (days_since_last_visited / Float(last_visited_max))*60

    score
  end
end