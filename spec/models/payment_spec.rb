require 'rails_helper'

RSpec.describe Payment, type: :model do

  describe 'relationships' do
    it { should belong_to(:loan) }
  end

  describe 'instance methods' do
    it '#finds total amount of payments' do
      
    end
  end

end