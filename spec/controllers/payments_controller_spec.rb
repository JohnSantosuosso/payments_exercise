require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe '#index' do
    loan_2 = Loan.create!(funded_amount: 100.00, remaining_balance: 100.00)
    payment_2 = loan_2.payments.create!(loan_id: loan_2.id, amount: 20.0, date: '2022-10-10')

    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    loan_1 = Loan.create!(funded_amount: 100.00, remaining_balance: 100.00)
    payment_1 = loan_1.payments.create!(loan_id: loan_1.id, amount: 20.0, date: '2022-10-10')

    it 'responds with a 200' do
      get :show, params: { amount: 20.0, date:'2022-10-10', id: payment_1.id, loan_id: loan_1.id }
      expect(response).to have_http_status(:ok)
    end

    context 'if the loan is overpaid' do
      it 'responds with a 404' do
        get :show, params: { amount: 120.0, date:'2022-10-10', id: payment_1.id, loan_id: loan_1.id }
        expect(response).to have_http_status(:not_found)
      end
    end
  end

  describe '#create' do
    loan_1 = Loan.create!(funded_amount: 100.00, remaining_balance: 100.00)
    payment_1 = loan_1.payments.create!(loan_id: loan_1.id, amount: 20.0, date: '2022-10-10')

    it 'responds with a 200' do
      get :show, params: { amount: 120.0, date:'2022-10-10' }
      expect(response).to have_http_status(:ok)
    end

    context 'if the loan is not found' do
      it 'responds with a 404' do
        get :show, params: { id: 10000 }
        expect(response).to have_http_status(:not_found)
        expect(response).to eql('Payment cannot be greater than existing balance')
      end
    end
  end
end
