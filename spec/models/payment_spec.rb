require 'rails_helper'

RSpec.describe Payment, type: :model do

  describe 'relationships' do
    it { should belong_to(:loan) }
  end

  describe 'validations' do
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:date) }
    it { should validate_numericality_of(:amount) }
    it { should validate_presence_of(:loan_id) }
  end
  
  describe 'instance methods' do
    it '#finds total amount of payments' do

    end
  end

end