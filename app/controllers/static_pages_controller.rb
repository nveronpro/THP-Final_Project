class StaticPagesController < ApplicationController
  def index
    @items = Item.all
  end

  def contact 
  end

  def info
  end

  def galerie

  end

  def about

  end
end
