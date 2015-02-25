class ChangeCreditDefaultToZeroInUsers < ActiveRecord::Migration
  def change
    change_column :users, :credits, :integer, :default => 0
  end
end
