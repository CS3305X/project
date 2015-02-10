class CreateClassSchedules < ActiveRecord::Migration
  def change
    create_table :class_schedules do |t|
      t.belongs_to :subjects, index: true
      t.string :module_code
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.boolean :cancelled

      t.timestamps
    end
  end
end
