class Restaurant < ActiveRecord::Base
  has_many :ratings
  has_attached_file :avatar, default_url: '/images/missing.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
end