class CreateOfferedTos < ActiveRecord::Migration
  def change
    create_table :offered_tos do |t|
      t.string :module_code
      t.string :course_id

      t.timestamps
    end
  end
end
