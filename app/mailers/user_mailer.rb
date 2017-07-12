class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sold.subject
  #
  def sold(seller, purchase)
    @seller = seller
    @purchase = purchase


    mail(to: seller.user.email, subject: 'You sold Sponti Tickets')
  end
end
