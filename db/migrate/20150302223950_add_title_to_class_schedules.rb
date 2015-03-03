class AddTitleToClassSchedules < ActiveRecord::Migration
  def change
    add_column :class_schedules, :title, :string
  end
end
