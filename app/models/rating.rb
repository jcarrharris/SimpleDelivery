class Rating < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :rate
end
