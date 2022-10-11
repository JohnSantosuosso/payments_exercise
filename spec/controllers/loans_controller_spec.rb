require 'rails_helper'

RSpec.describe LoansController, type: :controller do
  describe '#index' do
    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    loan = Loan.create!(funded_amount: 100.00)
    payment_1 = loan.payments.create!(loan_id: loan.id, amount: 20.0, date: '2022-10-10')
    payment_2 = loan.payments.create!(loan_id: loan.id, amount: 20.0, date: '2022-10-10')

    it 'responds with a 200' do
      get :show, params: { id: loan.id }
      expect(response).to have_http_status(:ok)
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, params: { id: 10000 }
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
