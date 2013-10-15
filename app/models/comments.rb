class Comments < ActiveRecord::Base
  has_many :ratings
  belongs_to :user
end
