class Business < ActiveRecord::Base
	has_many :locations
	belongs_to :user

	validates_presence_of :business_name, :website_url, :phone_number
end