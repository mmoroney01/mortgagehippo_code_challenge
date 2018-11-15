class TransactionsController < ApplicationController
  def see_all
  	@transactions = Transaction.all

  	p @transactions

  	render 'transactions/index'
  end

  def create
  	@coin = Coin.find_by(:name => params[:name], :value => params[:value].to_i)

  	@coin.update(deposited?: true)

  	Transaction.create(coin_id: @coin.id, apiuser_id: "1")

  	respond_to do |f|
      f.html { redirect_to root_path }
      f.js
    end
  end

  def see_all_transactions_one_user

  end
end
