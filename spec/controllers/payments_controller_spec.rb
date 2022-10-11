require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe '#index' do
    loan_2 = Loan.create!(funded_amount: 100.00)
    payment_2 = loan_2.payments.create!(loan_id: loan_2.id, amount: 20.0, date: '2022-10-10')

    it 'responds with a 200' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    loan_1 = Loan.create!(funded_amount: 100.00)
    payment_1 = loan_1.payments.create!(loan_id: loan_1.id, amount: 20.0, date: '2022-10-10')

    it 'responds with a 200' do
      get :show, params: { id: payment_1.id, loan_id: loan_1.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#create' do
    loan_1 = Loan.create!(funded_amount: 100.00)

    it 'responds with a 200' do
      get :create, params: { amount: 10.0, date:'2022-10-10', loan_id: loan_1.id }
      expect(response).to have_http_status(:ok)
    end

    context 'if the loan is overpaid' do
      it 'responds with a 404' do
        get :create, params: { amount: 120.0, date:'2022-10-10', loan_id: loan_1.id }
        expect(response).to have_http_status(:not_found)
        expect(response.body).to eql('Payment cannot be greater than existing balance')
      end
    end

    context 'if the payment is not properly formatted' do
      it 'responds with a 404' do
        get :create, params: { amount: 'one dollar', date:'2022-10-10', id: 3, loan_id: loan_1.id }
        expect(response.status).to eql(404)
        expect(response.body).to eql("[\"Amount is not a number\"]")
      end

      it 'responds with a 404' do
        get :create, params: { amount: -200.00, date:'2022-10-10', id: 3, loan_id: loan_1.id }
        expect(response.status).to eql(404)
        expect(response.body).to eql("[\"Amount must be greater than or equal to 0.01\"]")
      end
    end
  end
end
