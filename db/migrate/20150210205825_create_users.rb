class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.belongs_to :user_type, index: true
      t.integer :user_id
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
