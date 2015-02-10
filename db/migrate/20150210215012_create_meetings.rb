class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.string :location
      t.integer :organiser_id
      t.boolean :confirmed_by_all

      t.timestamps
    end
  end
end
