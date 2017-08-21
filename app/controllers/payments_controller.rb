class PaymentsController < ApplicationController

  before_action :set_order
  skip_after_action :verify_policy_scoped

  def new

  end

  def create

    # skip_after_action :verify_authorized
    # authorize charge
    # authorize customer
    # authorize payment
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_cents, # or amount_pennies
    description:  "Payment for Sponti Ticket #{@order.ticket_sku} for order #{@order.id}",
    currency:     @order.amount.currency
  )

   authorize @order
  @order.update(payment: charge.to_json, state: 'paid')
  redirect_to order_path(@order)

rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_order_payment_path(@order)
  end

  private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end

end
