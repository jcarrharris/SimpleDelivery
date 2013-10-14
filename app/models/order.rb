class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :business
  belongs_to :location
  paginates_per 20
  validate :in_the_future

  validates_presence_of :tracking_number, :delivery_address, :phone_number, :length, :width, :height, :weight, :quantity, :declared_value, :packaging, :pickup_time, :delivery_time
  validates_uniqueness_of :tracking_number
  validates :phone_number, length: { is: 10 }

  geocoded_by :delivery_address              # can also be an IP address
  after_validation :geocode, :if => :delivery_address_changed?  # auto-fetch coordinates
  
  def self.search(search)
    if search
      where('tracking_number LIKE ?', "%#{search}%")
    else
      scoped
    end
  end

  private
  def in_the_future
    if pickup_time < DateTime.now
      errors.add(:base, "We haven't invented time travel yet!")
    end

    if delivery_time <= pickup_time
      errors.add(:base, "We haven't invented time travel yet!")
    end
  end
end