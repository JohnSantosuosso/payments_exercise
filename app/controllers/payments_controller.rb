class PaymentsController < ActionController::API
  before_action :find_loan, :overpaid?

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Payment.all
  end

  def create
  payment = Payment.new(amount: params[:amount], date: params[:date], loan_id: @loan.id)
    if payment.save
        render json: Payment.find(payment.id)
    else
      render json: payment.errors.full_messages
    end
  end

  def show
    render json: Payment.find(params[:id])
  end

  private
  def payment_params
    params.permit(:amount, :date, :loan_id)
  end

  def find_loan
    @loan = Loan.find(params[:loan_id])
  end

  def overpaid?
    require 'pry'; binding.pry 
   if @loan.total_payments + params[:amount].to_f > @loan.funded_amount
    return render json: { message: "Payment cannot be greater than existing balance" }
   end
  end
end
