class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.integer :type_id
      t.string :type_name

      t.timestamps
    end
  end
end
