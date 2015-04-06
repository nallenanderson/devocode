class Course < ActiveRecord::Base
	has_attached_file :image, styles: { medium: "300x300#", thumb: "C100x100#" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :videos

  #callbacks
 	after_create :update_slug
 	before_update :assign_slug

 	def to_param
     slug
 	end

	private

	def assign_slug
	   self.slug = "#{ name.parameterize }"
	end

	def update_slug
	   update_attributes slug: assign_slug
	end
end
