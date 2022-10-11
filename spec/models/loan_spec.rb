require 'rails_helper'

RSpec.describe Loan, type: :model do

  describe 'relationships' do
    it { should have_many(:payments) }
  end

  describe 'validations' do
    it { should validate_presence_of(:funded_amount) }
    it { should validate_presence_of(:remaining_balance) }
    it { should validate_numericality_of(:funded_amount) }
    it { should validate_numericality_of(:remaining_balance) }
  end
  
end