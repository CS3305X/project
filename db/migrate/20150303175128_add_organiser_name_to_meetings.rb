class AddOrganiserNameToMeetings < ActiveRecord::Migration
  def change
    add_column :meetings, :organiser_name, :string
  end
end
