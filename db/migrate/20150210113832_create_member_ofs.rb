class CreateMemberOfs < ActiveRecord::Migration
  def change
    create_table :member_ofs do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
