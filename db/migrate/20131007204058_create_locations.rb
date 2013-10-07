class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
    	t.string :address
    	t.integer :phone_number
    	t.float :latitude
    	t.float :longitude
    	t.integer :user_id

      t.timestamps
    end
  end
end