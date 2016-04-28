class AddPayedAmountToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :amount_payed, :money, array: true, default: []
  end
end
