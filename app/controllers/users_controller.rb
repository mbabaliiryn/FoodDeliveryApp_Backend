class UsersController < ApplicationController
  before_action :authorized, only: [:auto_login]

  def create
    @entity = params[:entity_type] = 'Restaurant' ? Restaurant.new : Constomer.new
    @entity.save!
    @user = User.create(user_params)
    if @user.valid?
      @address = Address.new(address_params)
      @address.user_id = @user_id
    if @address.valid?
      AddressWorker.perform_async(@address.id)
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    end
  end
end


  def login
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def auto_login
    render json: @user
  end

  def show
    @user = User.find(params[:id])
  end


 def update_contact_number
  @user = current_user
  if @user
    if @user.update(contact_number: params[:contact_number])
      render :show
    else
      render json: @user.errors, status: 400
    end
  else
    render json: ["No user found"], status: 404
  end
end

def update_address
  @user = current_user
  @address = @user.address
  if @address
    if @address.update(address_params)
      render "address/show"
    else
      render json: @address.errors, status: 400
    end
  else
    render json: ["Cannot find address"], status: 404
  end
end

def get_delivering_restaurants
  @restaurants = current_user.get_delivering_restaurants
  if @restaurants
    render json: @restaurants
  else
    render json: @item.errors.full_messages, status: 422
  end
end

  private

  def address_params
    params.permit(:line1,:line2,:city,:state,:country,:zipcode)
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password_digest, :entity_type, :contact_number)
  end
end
