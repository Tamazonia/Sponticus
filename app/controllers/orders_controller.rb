class OrdersController < ApplicationController

  def create

    @ticket = Ticket.find(params[:ticket_id])

    order_quantity = params[:order_quantity]


    @order  = Order.create!(  ticket_sku: @ticket.sku,
                          unit_price_cents: @ticket.price,
                          quantity: order_quantity.first.to_i,
                          amount: @ticket.price*order_quantity.first.to_i,
                          state: 'pending',
                          ticket: @ticket,
                          user: current_user)

    redirect_to new_order_payment_path(@order)

  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  def send_confirmation_mail
  @order = Order.find(params[:id])
  @user = @order.user

  UserMailer.order_send(@order, @user).deliver_now
  flash[:notice] = "Email Confirmation has been sent."
  redirect_to order_path(@order)
  # redirect_to order_path(@order.id)
  end

end
