class AddCreditValueToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :credits, :integer
  end
end
