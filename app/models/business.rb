class Business < ActiveRecord::Base
	has_many :locations
  has_many :orders, through: :locations
	belongs_to :user

	validates_presence_of :business_name, :website_url, :phone_number
  validates :phone_number, length: { is: 10 }
  
  mount_uploader :image, ImageUploader
end