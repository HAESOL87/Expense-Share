class AddParticipantsToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :p1, :string
    add_column :expenses, :p2, :string
    add_column :expenses, :p3, :string
    add_column :expenses, :p4, :string
    add_column :expenses, :p5, :string
    add_column :expenses, :a1, :money
    add_column :expenses, :a2, :money
    add_column :expenses, :a3, :money
    add_column :expenses, :a4, :money
    add_column :expenses, :a5, :money
  end
end
