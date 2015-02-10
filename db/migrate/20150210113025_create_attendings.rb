class CreateAttendings < ActiveRecord::Migration
  def change
    create_table :attendings do |t|
      t.integer :user_id
      t.integer :meeting_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
