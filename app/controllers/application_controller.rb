class ApplicationController < ActionController::API
 before_action :authorized
 
  def encode_token(payload)
    # should store secret in env variable
    JWT.encode(payload, 'sw0p_sh0p')
  end
 
  def auth_header
    # { Authorization: 'Bearer <token>' }
    request.headers['Authorization']
  end
 
  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, 'sw0p_sh0p', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end
 
  def current_customer
    if decoded_token
      customer_id = decoded_token[0]['customer_id']
      @customer = Customer.find_by(id: customer_id)
    end
  end
 
  def logged_in?
    !!current_customer
  end
 
  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

end
