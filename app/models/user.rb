class User < ActiveRecord::Base
  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :businesses
  has_many :authentications, dependent: destroy
  accepts_nested_attributes_for :authentications
  has_many :locations, through: :businesses
  has_many :orders, through: :locations
  
  validates_presence_of :first_name, :last_name, :email, :password
  validates_confirmation_of :password, message: "Passwords do not match!"
end