class Loan < ActiveRecord::Base
  has_many :payments

  validates :funded_amount, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :remaining_balance, presence: true, numericality: true
end
