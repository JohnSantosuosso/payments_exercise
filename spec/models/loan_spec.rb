require 'rails_helper'

RSpec.describe Loan, type: :model do

  describe 'relationships' do
    it { should have_many(:payments) }
  end

end