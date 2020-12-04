class ChargesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @user = current_user
  end
  
  def create
    # Amount in cents
    @cart = current_user.cart
    @amount = @cart.items.pluck(:price).sum.to_i * 100
  
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


  @cart.items.each do |item|
    order = Order.create(item: item, start_date: DateTime.now, end_date: DateTime.now + item.sub_category.duration.months)
    OrderUser.create(user_id: current_user.id, order: order)
  end
  @cart.items.destroy_all
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

  
  
    

    
