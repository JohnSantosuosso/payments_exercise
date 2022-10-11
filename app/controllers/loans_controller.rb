class LoansController < ActionController::API
  before_action :find_loan, only: [:show] 

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    render json: Loan.all
  end

  def show
    render json: { :loan=>@loan, 
                  :payments=>@loan.payments }
  end

  private
  def find_loan
    @loan = Loan.find(params[:id])
  end
end
