class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
    	t.string :business_name
      t.string :website_url
      t.integer :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
