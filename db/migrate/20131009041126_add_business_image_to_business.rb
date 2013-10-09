class AddBusinessImageToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :image, :string
  end
end
