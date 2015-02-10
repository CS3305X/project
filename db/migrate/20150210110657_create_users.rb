class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.integer :user_type
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_num
      t.string :password_digest
      t.boolean :activated

      t.timestamps
    end
  end
end
