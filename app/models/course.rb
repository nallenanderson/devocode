class Course < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "300x300#", thumb: "C100x100#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :videos
  extend FriendlyId
  friendly_id :name, use: :slugged
end
