class AddArrayVariableToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :participant, :string, array: true, default: []
  end
end
