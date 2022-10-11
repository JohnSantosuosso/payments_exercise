class PaymentsController < ActionController::API
  before_action :find_loan, only:[create, update]

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def create
    payment = Payment.new(amount: params[:amount], date: params[:date], loan_id: @loan.id)
    if payment.save
  end

  def show
    render json: Payment.find(params[:id])
  end

  private
  def find_loan
    @loan = Loan.find(params[:loan_id])
  end

  def payment_params
    params.permit(:amount, :date, :loan_id)
  end

end
