class Location < ActiveRecord::Base
	has_many :orders
  belongs_to :user
  belongs_to :business

	validates_presence_of :address, :phone_number

	geocoded_by :address   						# can also be an IP address
	after_validation :geocode, :if => :address_changed?  # auto-fetch coordinates
end