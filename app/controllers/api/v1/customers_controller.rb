class Api::V1::CustomersController < ApplicationController
	
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { customer: CustomerSerializer.new(current_customer) }, status: :accepted
  end


def create
    @customer = Customer.create(user_params)
    if @customer.valid?
      @token = encode_token(customer_id: @customer.id)
      render json: { customer: CustomerSerializer.new(@customer), jwt: @token  }, status: :created
    else
      render json: { error: 'failed to create new customer' }, status: :not_acceptable
    end
  end
 
  private
  def user_params
    params.require(:customer).permit(:username, :password, :email)
  end
end
