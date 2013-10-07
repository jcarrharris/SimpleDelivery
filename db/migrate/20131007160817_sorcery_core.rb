class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :crypted_password
      t.string :salt
      t.string :business_name
      t.string :website_url
      t.integer :phone_number

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end