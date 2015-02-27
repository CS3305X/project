class CreateAttendings < ActiveRecord::Migration
  def change
    create_table :attendings do |t|
      t.string :user_id
      t.integer :meeting_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
