class Payment < ActiveRecord::Base
  belongs_to :loan

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
