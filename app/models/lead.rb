class Lead < ActiveRecord::Base
	validates :name, :email, :message, presence: true
end
