class User < ActiveRecord::Base
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :businesses
  has_many :locations, through: :businesses
  has_many :orders
  has_many :ratings
  
  # validates_presence_of :email, :password, :first_name, :last_name
  validates_uniqueness_of :email
  # validates :password, length: { minimum: 8 }
  validates_confirmation_of :password, message: "Passwords do not match!"

  mount_uploader :image, ImageUploader

  private
  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end