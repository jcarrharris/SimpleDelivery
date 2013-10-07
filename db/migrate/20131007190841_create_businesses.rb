class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
    	t.string "business_name"
    	t.string "address"
    	t.integer "phone_number"
    	t.string "website_url"
    	t.datetime "hours_of_operation"
    	t.string "payment_methods"
    	t.float "latitude"
    	t.float "longitude"
      t.timestamps
    end	
  end
end
