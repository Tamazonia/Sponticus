
class OrderMailer < ActionMailer::Base

  # add_template_helper(OrdersHelper)

  # default from: "mail@example.com"

  def order_send(order, user)
    @order = order
    @user = user
    mail(to: "#{@user.email}", subject: "Your sponti confirmation")
  end
end
