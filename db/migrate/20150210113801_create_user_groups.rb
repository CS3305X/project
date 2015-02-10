class CreateUserGroups < ActiveRecord::Migration
  def change
    create_table :user_groups do |t|
      t.integer :group_id
      t.string :group_name
      t.string :description
      t.integer :admin_id

      t.timestamps
    end
  end
end
