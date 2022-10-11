require 'rails_helper'

RSpec.describe Loan, type: :model do

  describe 'relationships' do
    it { should have_many(:payments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:funded_amount) }
    it { should validate_numericality_of(:funded_amount) }
  end

  describe 'instance methods' do
    it 'finds total payments' do
      loan_1 = Loan.create!(funded_amount: 100.00)
      payment_1 = loan_1.payments.create!(loan_id: loan_1.id, amount: 20.0, date: '2022-10-10')
      expect(loan_1.total_payments).to eql(20.0)
    end
  end
  
end