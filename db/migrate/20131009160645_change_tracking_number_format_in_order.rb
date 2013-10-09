class ChangeTrackingNumberFormatInOrder < ActiveRecord::Migration
  def self.up
   change_column :orders, :tracking_number, :string
  end

  def self.down
   change_column :orders, :tracking_number, :integer
  end
end
