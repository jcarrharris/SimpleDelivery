class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.string :location_name
      t.string :address
    	t.integer :phone_number
    	t.float :latitude
    	t.float :longitude
    	t.integer :business_id

      t.timestamps
    end
  end
end