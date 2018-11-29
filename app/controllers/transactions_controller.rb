class TransactionsController < ApplicationController
  before_action :authenticate_user

  def see_all
  	@transactions = Transaction.all
    
  	render json: @transactions
  end

  def create
  	@transaction = Transaction.create(coin_id: params[:transaction][:coin_id], user_id: current_user.id)

   if @transaction
      render json: { msg: "your coin has been deposited" }
    else
      render json: { msg: "your coin could not be deposited" }
    end
  end
end