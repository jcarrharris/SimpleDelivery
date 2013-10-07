class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates_presence_of :first_name, :last_name, :email, :password
  validates_length_of :password, minimum: 5, message: "Password must be at least 5 characters long!"
  validates_confirmation_of :password, on: :create, message: "Passwords do not match!"
end
