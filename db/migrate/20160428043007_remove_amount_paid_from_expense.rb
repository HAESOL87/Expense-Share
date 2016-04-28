class RemoveAmountPaidFromExpense < ActiveRecord::Migration
  def change
    remove_column :expenses, :amount_payed, :string
  end
end
