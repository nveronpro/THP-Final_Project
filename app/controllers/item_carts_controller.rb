class ItemCartsController < ApplicationController
  before_action :find_item, only: [:destroy]
  before_action :find_item_spe, only: [:create]
    
  def create
    return if current_user.cart.items.first
    cart = current_user.cart
    cart.items << @item
    if cart.save
      flash[:success] = t("product_atc")
      redirect_to carts_path
    else 
      flash[:warning] = t("product_atc_fail")
      redirect_to root_path
    end
  end

  def destroy
    current_user.cart.items.destroy(@item)
    redirect_to carts_path
  end

  private 

  def find_item_spe
      @item = Item.friendly.find(params[:item_id])
  end

  def find_item
    @item = Item.friendly.find(params[:id])
end
end