class Restaurant < ActiveRecord::Base
  has_many :ratings
  has_attached_file :avatar, default_url: '/images/missing.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true

  def avg_rating
    if !self.ratings.empty?
      ratings = self.ratings.pluck(:rate)
      ratings.inject(:+) / Float(ratings.count)
    else 0.0; end
  end

  def score(user)
  end
end