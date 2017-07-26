class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sold.subject
  #
  def sold(seller, order)
    @seller = seller
    @order = order
    mail(to: seller.user.email, subject: 'You just sold Sponti Tickets')
  end

  def bought(buyer, order)
    @buyer = buyer
    @order = order
    mail(to: buyer.email, subject: 'You just bought Sponti Tickets')
  end


end
