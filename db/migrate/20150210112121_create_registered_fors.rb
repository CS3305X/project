class CreateRegisteredFors < ActiveRecord::Migration
  def change
    create_table :registered_fors do |t|
      t.integer :user_id
      t.string :module_code

      t.timestamps
    end
  end
end
