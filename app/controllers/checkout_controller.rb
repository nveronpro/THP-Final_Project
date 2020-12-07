class CheckoutController < ApplicationController
  def create 
    @cart = current_user.cart

    if @cart.nil?
      redirect_to root_path
      return
    end

    @session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            mode: 'subscription',
            line_items: [{
                    name: "Votre panier",
                    description: "Votre abonnement",                    
                    amount: @cart.items.pluck(:price).sum.to_i * 100,
                    currency: 'eur',
                    quantity: 1,
                    price: data['price_1HvhPjLpDhDvbzmLGbrHK6FZ']
                  }],
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url,
        })

    respond_to do |format|
        format.js #render create.js.erb
    end
  end

  def success  
    @cart = current_user.cart
    @cart.items.each do |item|
      order = Order.create(item: item, start_date: DateTime.now, end_date: DateTime.now + item.sub_category.duration.months)
      OrderUser.create(user_id: current_user.id, order: order)
    end
    @cart.items.destroy_all
  end
  
  def cancel

  end
end
