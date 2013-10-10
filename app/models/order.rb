class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :business
  belongs_to :location

  validates_presence_of :tracking_number, :delivery_address, :phone_number, :length, :width, :height, :weight, :quantity, :declared_value, :packaging, :pickup_time, :delivery_time
  validates_uniqueness_of :tracking_number

  geocoded_by :delivery_address              # can also be an IP address
  after_validation :geocode, :if => :delivery_address_changed?  # auto-fetch coordinates
end