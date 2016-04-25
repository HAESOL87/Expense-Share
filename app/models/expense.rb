class Expense < ActiveRecord::Base
  validates :title, :total_amount, :total_person, presence: true

  before_save :default_values

  private

  def default_values
    self.cleared ||= false
    nil                           # required so that TX will not rollback!!!
  end
end
