class Loan < ActiveRecord::Base
  has_many :payments

  validates :amount_funded, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  
end
