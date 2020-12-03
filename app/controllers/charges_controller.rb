class ChargesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user = current_user
    @amount = current_user.cart.items.pluck(:price).sum.to_f * 100
  end
  
  def create
    # Amount in cents
    @cart = current_user.cart
    @amount = @cart.items.pluck(:price).sum.to_f * 100
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

  @order = Order.create(user_id: current_user.id)
  @cart.items.each do |item|
    AssociateOrderItem.create(order: @order, item: item)
  end
  @cart.items.destroy_all
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

  
  
    

    
