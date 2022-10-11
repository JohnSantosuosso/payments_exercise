class LoansController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: 'not_found', status: :not_found
  end

  def index
    require 'pry'; binding.pry 
    render json: Loan.all
  end

  def show
    render json: Loan.find(params[:id])
  end
end
