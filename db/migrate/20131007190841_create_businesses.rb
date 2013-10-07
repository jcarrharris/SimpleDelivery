class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
    	t.string "name"
    	t.string "address"
    	t.integer "phone_number"
    	t.string "website_url"
    	t.integer "hours_of_operation"
    	t.string "payment_methods"

      t.timestamps
    end
  end
end
