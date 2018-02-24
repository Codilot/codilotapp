class PaymentsController < ApplicationController

  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user


    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price * 100).to_i,
        currency: "eur",
        source: token,
        description: params[:stripeEmail]
      )

    if charge.paid
      Order.create(
        product_id: @product.id, 
        user_id: @user.id, 
        total: @product.price
        )
      redirect_to payments_purchase_path
      UserMailer.confirmation_purchase(@user, @product).deliver_now
    end

    rescue Stripe::CardError => e
      # The card has been declined
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
        redirect_to product_path(@product)
    end
    
  end

  def purchase
    @latest_products = Product.last(4)
  end
end
