class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :module_code
      t.string :description
      t.integer :lecturer_id

      t.timestamps
    end
  end
end
