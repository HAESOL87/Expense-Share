class Expense < ActiveRecord::Base
  belongs_to :user

  validates :title, :total_amount, presence: true

  before_save :default_values

  private

  def default_values
    self.cleared ||= false
    self.amount_payed ||= 0
    nil                           # required so that TX will not rollback!!!
  end
end
