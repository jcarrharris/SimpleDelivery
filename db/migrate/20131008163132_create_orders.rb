class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :tracking_number
      t.string :delivery_address
      t.integer :phone_number
      t.float :latitude
      t.float :longitude
      t.integer :location_id
      t.integer :length
      t.integer :width
      t.integer :height
      t.integer :weight
      t.integer :quantity
      t.integer :declared_value
      t.string :packaging
      t.datetime :pickup_time
      t.datetime :delivery_time
      t.string :status

      t.timestamps
    end
  end
end
