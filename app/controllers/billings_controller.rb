class BillingsController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def new_card
    respond_to do |format|
      format.js
    end
  end

  def create_card
    respond_to do |format|
      if current_user.stripe_id.nil?
        customer = Stripe::Customer.create("email": current_user.email)
        current_user.update(stripe_id: customer.id)
      end

      card_token = params[:stripeToken]
      format.html { redirect_to billings_path, error: "Oops" } if card_token.nil?

      customer = Stripe::Customer.new current_user.stripe_id
      customer.source = card_token
      customer.save

      format.html { redirect_to success_path }
    end
  end

  def success; end

  def payment
    customer = Stripe::Customer.new current_user.stripe_id
    @payment = Stripe::Charge.create customer: customer.id,
                                     amount: current_user.orders.last.total / 10,
                                     description: "Payments",
                                     currency: "usd"
    @payment.save
    @user = current_user
    @order = Order.last
    OrderMailer.order_mail(@order, @user).deliver_now if current_user.present?
    flash[:success] = t ".success"
    redirect_to root_url
  end
end
