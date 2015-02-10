class CreateUsertypes < ActiveRecord::Migration
  def change
    create_table :usertypes do |t|
      t.integer :type_id
      t.string :type_name#

      t.timestamps
    end
  end
end
