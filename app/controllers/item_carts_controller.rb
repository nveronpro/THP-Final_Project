class ItemCartsController < ApplicationController
  before_action :find_item, only: [:create, :destroy]
    
  def create
    cart = current_user.cart
    cart.items << @item
    if cart.save
      flash[:success] = "Produit ajouté au panier"
      redirect_to carts_path
    else 
      flash[:warning] = "Produit non ajouté"
      redirect_to root_path
    end
  end

  def destroy
    @itemcart = find_itemcart.sample
    @itemcart.delete
    redirect_to carts_path
  end

  private 

  def find_item
      @item = Item.find(params[:id])
  end

  def find_itemcart
    ItemCart.all.each do |cart|
        @itemcart = cart if (cart.id == current_user.cart && cart.item == find_item)
    end
  end
end