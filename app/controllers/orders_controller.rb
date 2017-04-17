class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(user_id: current_user.id, total: params[:total])
    if @order.save
      @cart.contents.each do |escape_id, quantity|
        @order.order_escapes.create(escape_id: escape_id, quantity: quantity, total: @order.subtotal(escape_id, quantity))
      end
      @cart.contents.clear
      session[:cart] = @cart.contents
      flash[:success] = "Order was successfully placed"
      redirect_to orders_path
    else
      redirect_to cart_path
      flash[:alert] = "Order not placed"
    end
  end

  def new
    @order_items = @cart.find_escapes
  end

  def update
    @order = Order.find(params[:id])

    if @order.update(status: params[:status])
      flash[:success] = "Order status updated"
      redirect_to admin_dashboard_path
    else
      flash[:alert] = "Nopes"
    end
  end

  # private

  # def order_params
  #   binding.pry
  #   params.require(:order).permit(:status)
  # end

end
