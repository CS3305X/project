class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :module_code
      t.string :description
      t.integer :lecturer_id

      t.timestamps
    end
    
    create_table :RegisteredFor, id: false do |t|
      t.belongs_to :users, index: true
      t.belongs_to :subjects, index: true
    end
  end
end
