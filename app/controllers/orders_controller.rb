class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  def index
    @orders = Order.all
  end

  def show
  end

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: t("order_created") }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order.skip_month? == false ? @order.update(skip_month?: true) : @order.update(skip_month?: true)
    define_date_pause
    respond_to do |format|
      if AdminMailer.skipmonth_email(@order).deliver_now
        # re-initialize Home object for cleared form
        format.html { redirect_to root_path, notice: t("message_sent")}
        format.json { render :create, status: :ok }
      else
        format.html { redirect_to new_contact_path, notice: t("issue_message_sent") }
        format.json { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Votre commande a bien été supprimée' }
      format.json { head :no_content }
    end
  end

  private

    def define_date_pause
      @order.update(start_pause: DateTime.now, end_pause: DateTime.now + 1.month)
    end
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:start_date, :end_date, :duration)
    end
end
