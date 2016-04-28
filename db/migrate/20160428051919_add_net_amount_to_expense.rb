class AddNetAmountToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :amount_net, :money, array: true, default: []
  end
end
