class ItemCartsController < ApplicationController
  before_action :find_item, only: [:create, :destroy]
    
  def create
    return if current_user.cart.items.find_by(id: @item.id)
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
    current_user.cart.items.destroy(@item)
    redirect_to carts_path
  end

  private 

  def find_item
      @item = Item.friendly.find(params[:id])
  end
end