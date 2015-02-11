class Removeuserid < ActiveRecord::Migration
  def change
     remove_column :users, :user_id
  end
  def down
    add_column :users, :user_id, :integer
  end
end
