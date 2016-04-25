json.array!(@expenses) do |expense|
  json.extract! expense, :id, :title, :total_amount, :total_person, :responsible_amount, :amount_payed, :amount_owed, :amount_with_who, :cleared, :comment
  json.url expense_url(expense, format: :json)
end
