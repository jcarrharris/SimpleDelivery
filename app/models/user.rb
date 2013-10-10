class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :businesses
  has_many :authentications
  accepts_nested_attributes_for :authentications
  has_many :locations, through: :businesses
  has_many :orders, through: :locations
  
  validates_presence_of :first_name, :last_name, :email, :password
  validates_uniqueness_of :email
  validates :password, length: { minimum: 8 }
  validates_confirmation_of :password, message: "Passwords do not match!"

  mount_uploader :image, ImageUploader
end