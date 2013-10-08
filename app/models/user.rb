class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :businesses
  
  validates_presence_of :first_name, :last_name, :email, :password
  validates_confirmation_of :password, message: "Passwords do not match!"
end