class AdminMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to the Coin Machine API!')
  end

  def four_coins_or_less(users, coin, coin_total)
    @coin = coin
    @total = coin_total
	  @emails = []
	  users.each { |user| @emails.push(user.email) }
	  mail(to: @emails, subject: "#{coin.name} has four or fewer coins available to withdraw")
  end
end
