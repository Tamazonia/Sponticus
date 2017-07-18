class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sold.subject
  #
  def sold(seller, purchase)
    @seller = seller
    @purchase = purchase
    mail(to: seller.user.email, subject: 'You just sold Sponti Tickets')
  end

  def bought(buyer, purchase)
    @buyer = buyer
    @purchase = purchase
    mail(to: buyer.email, subject: 'You just bought Sponti Tickets')
  end


end
