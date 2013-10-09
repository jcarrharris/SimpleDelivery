class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :business
  belongs_to :location

  validates_presence_of :delivery_address, :phone_number, :length, :width, :height, :weight, :quantity, :declared_value, :packaging, :pickup_time, :delivery_time
end