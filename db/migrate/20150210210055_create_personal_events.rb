class CreatePersonalEvents < ActiveRecord::Migration
  def change
    create_table :personal_events do |t|
      t.belongs_to :user, index: true
      t.string :event_name
      t.string :description
      t.string :location
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
