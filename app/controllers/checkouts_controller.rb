class CheckoutsController < ApplicationController
    TRANSACTION_SUCCESS_STATUSES = [
      Braintree::Transaction::Status::Authorizing,
      Braintree::Transaction::Status::Authorized,
      Braintree::Transaction::Status::Settled,
      Braintree::Transaction::Status::SettlementConfirmed,
      Braintree::Transaction::Status::SettlementPending,
      Braintree::Transaction::Status::Settling,
      Braintree::Transaction::Status::SubmittedForSettlement,
    ]
  
    def new
      @client_token = gateway.client_token.generate
    end
  
    def show
      @transaction = gateway.transaction.find(params[:id])
      @result = _create_result_hash(@transaction)
      @order = Order.find(params[:order_id])
    end
  
    def create
      amount = params["amount"] # In production you should not take amounts directly from clients
      nonce = params["payment_method_nonce"]
  
      result = gateway.transaction.sale(
        amount: amount,
        payment_method_nonce: nonce,
        :options => {
          :submit_for_settlement => true
        }
      )
  
      if result.success? || result.transaction

        if user_signed_in?
          @order = current_user.orders.create(status: 1)
        else
          @order = Order.create(status: 1)
        end
        
        if @order.save
          @cart.cart_items.each do |cart_item|
            if cart_item.item_type == "Product"
              @order_item = @order.order_items.create(product: "#{cart_item.item.name} (#{sprintf "%.2f",cart_item.item.price}/ea)", quantity: cart_item.quantity, price: cart_item.price_cents)
            else
              @order_item = @order.order_items.create(product: "#{cart_item.item.product.name} (#{cart_item.item.variant_item.name}) (#{sprintf "%.2f",cart_item.item.price}/ea)", quantity: cart_item.quantity, price: cart_item.price_cents)
            end
    
            cart_item.cart_item_options.each do |cart_item_option|
              @order_item.order_item_options.create(name: cart_item_option.option_item.name, price: cart_item_option.option_item.price)
            end
          end
        end

        redirect_to checkout_path(id: result.transaction.id, order_id: @order.id)
      else
        error_messages = result.errors.map { |error| "Error: #{error.code}: #{error.message}" }
        flash[:error] = error_messages
        redirect_to new_checkout_path
      end
    end
  
    def _create_result_hash(transaction)
      status = transaction.status
  
      if TRANSACTION_SUCCESS_STATUSES.include? status
        result_hash = {
          :header => "Sweet Success!",
          :icon => "success",
          :message => "Your transaction has been successfully processed. Thank you for ordering with Jocha"
        }
      else
        result_hash = {
          :header => "Transaction Failed",
          :icon => "fail",
          :message => "Your test transaction has a status of #{status}. See the Braintree API response and try again."
        }
      end
    end
  
    def gateway
      @gateway ||= Braintree::Gateway.new(
        environment: :sandbox,
        :merchant_id => 'm7jf5wzwgdsbcqzw',
        :public_key => 'vm5dk6pxbphyt7g3',
        :private_key => '003728ef6152735bd141b9baec86040b',
      )
    end
  end
