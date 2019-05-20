class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]
 
  def create
    binding.pry
   #Set this up to work for customer
    @customer = Customer.find_by(username: user_login_params[:username])
    # User#authenticate comes from BCrypt
    if @customer && @customer.authenticate(user_login_params[:password])
      # encode token comes from ApplicationController
      token = encode_token({ customer_id: @customer.id })
      render json: { customer: CustomerSerializer.new(@customer), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end
 
  private
 
  def user_login_params
    # params { user: {username: 'Chandler Bing', password: 'hi' } }
    params.require(:customer).permit(:username, :password)
  end
end


