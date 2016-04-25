class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :title, null: false
      t.money :total_amount, null: false
      t.integer :total_person, null: false
      t.money :responsible_amount
      t.money :amount_payed
      t.money :amount_owed
      t.string :amount_with_who
      t.boolean :cleared
      t.string :comment

      t.timestamps null: false
    end
  end
end
