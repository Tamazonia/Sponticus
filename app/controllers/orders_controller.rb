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

      # if order.save
        redirect_to new_order_payment_path(@order)
      # else
      # end

      # if @order.save
      #   if @order.state == "paid"
      #     @ticket.amount_tickets_sold += @order.quantity
      #     @ticket.amount_tickets_spare = @ticket.amount_tickets_to_sell - @ticket.amount_tickets_sold
      #     @ticket.save
      #   end
      # end


  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:ticket_id)
  end


end
