class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :businesses
  has_many :locations, through: :businesses
  has_many :orders
  has_many :ratings
  has_many :comments
  
  # validates_presence_of :email, :password, :first_name, :last_name
  validates_uniqueness_of :email
  # validates :password, length: { minimum: 8 }
  validates_confirmation_of :password, message: "Passwords do not match!"

  mount_uploader :image, ImageUploader
end
