class AddNewArrayToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :bigParticipant, :string, array: true, default: []
  end
end
