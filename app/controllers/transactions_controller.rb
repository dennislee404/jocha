class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @client_token = gateway.client_token.generate
  end

  def create
    result = gateway.transaction.sale(
      :amount => "10.00",
      :payment_method_nonce => nonce_from_the_client,
      :device_data => device_data_from_the_client,
      :options => {
        :submit_for_settlement => true
      }
    )
  end

 
end