class AlterLocationPhoneNumber < ActiveRecord::Migration
  def change
    reversible do |dir|
          dir.up do
            #add a foreign key
            execute <<-SQL
              ALTER TABLE locations
                ALTER COLUMN phone_number
                TYPE bigint
                USING phone_number::bigint
            SQL
          end
        end
  end
end
